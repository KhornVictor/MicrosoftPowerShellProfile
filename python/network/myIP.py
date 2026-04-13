import requests
from colorama import Fore, Back, Style, init
from decimalToBinary import decimal_ip_to_binary

init(autoreset=True)

try:
    data = requests.get("https://ipinfo.io/json", timeout=5)
    data.raise_for_status()
    info = data.json()
    
    print("\n" + "="*50)
    print(f"{Fore.CYAN}{Back.BLACK}╔══════════════════════════════════════════════╗{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{Back.BLACK}║{Fore.YELLOW}{Style.BRIGHT}          IP INFORMATION DETAILS{Style.RESET_ALL}{Fore.CYAN}{Back.BLACK}              ║{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{Back.BLACK}╚══════════════════════════════════════════════╝{Style.RESET_ALL}")
    print("="*50 + "\n")
    
    for idx, (key, value) in enumerate(info.items(), 1):
        key_formatted = key.upper().replace("_", " ")
        if key == "ip":
            binary_ip = decimal_ip_to_binary(value)
            print(f"{Fore.GREEN}[{idx:2d}]{Style.RESET_ALL} {Fore.WHITE}{key_formatted:.<20}{Style.RESET_ALL} {Fore.YELLOW}{value} {Fore.MAGENTA}({binary_ip})")
            continue
        print(f"{Fore.GREEN}[{idx:2d}]{Style.RESET_ALL} {Fore.WHITE}{key_formatted:.<20}{Style.RESET_ALL} {Fore.YELLOW}{value}")
    
    # Footer
    print("\n" + "="*50)
    print(f"{Fore.CYAN}{Back.BLACK}╔══════════════════════════════════════════════╗{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{Back.BLACK}║{Fore.GREEN}{Style.BRIGHT}       ✓ Data retrieved successfully{Style.RESET_ALL}{Fore.CYAN}{Back.BLACK}          ║{Style.RESET_ALL}")
    print(f"{Fore.CYAN}{Back.BLACK}╚══════════════════════════════════════════════╝{Style.RESET_ALL}")
    print("="*50 + "\n")

except requests.exceptions.RequestException as e:
    print(f"\n{Fore.RED}{Style.BRIGHT}✗ Error: Unable to fetch IP information{Style.RESET_ALL}")
    print(f"{Fore.RED}Details: {e}{Style.RESET_ALL}\n")