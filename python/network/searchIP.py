import requests
import sys
from colorama import Fore, Style, init
from decimalToBinary import decimal_ip_to_binary

init(autoreset=True)

def get_ip_info(target=""):
    url = f"https://ipinfo.io/{target}/json" if target else "https://ipinfo.io/json"
    try:
        response = requests.get(url, timeout=5)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(Fore.RED + f"[!] Error: {e}")
        return None

def display_info(data):
    print(Fore.MAGENTA + "\n[+] IP Information\n" + "-" * 70)
    for key, value in data.items(): 
        if key == "ip":
            binary_ip = decimal_ip_to_binary(value)
            ip_address = value
            print(Fore.CYAN + f"{key:<12}" + Style.RESET_ALL + f": {value} " + Fore.MAGENTA + f"({binary_ip})")
        elif key == "readme": print(Fore.CYAN + f"{key:<12}" + Style.RESET_ALL + f": " + Fore.RESET + f"https://ipinfo.io/{ip_address}?lookup_source=search-bar")
        else:print(Fore.CYAN + f"{key:<12}" + Style.RESET_ALL + f": {value}")
    print(f"{Fore.CYAN}map{Fore.RESET}         : https://www.google.com/maps?q={data.get('loc','N/A')}" if 'loc' in data else "map: N/A")
    print(Fore.MAGENTA + "-" * 70)

def main():
    if len(sys.argv) < 2:
        print("Usage: python searchIP.py <IP or domain>")
        print("Example: python searchIP.py 8.8.8.8")
        sys.exit(1)
    target = sys.argv[1]
    
    print(Fore.RESET) 
    data = get_ip_info(target)
    if data: display_info(data)

if __name__ == "__main__":
    main()
