import requests
import time
import sys
from colorama import Fore, Style


def calculate_jitter(delays):
    if len(delays) < 2: return 0.0
    total = 0.0
    for i in range(1, len(delays)): total += abs(delays[i] - delays[i - 1])
    return total / (len(delays) - 1)


def jitter_status(jitter):
    if jitter <= 20: return f"{Fore.GREEN}Excellent{Style.RESET_ALL}"
    elif jitter <= 50: return f"{Fore.YELLOW}Acceptable{Style.RESET_ALL}"
    else: return f"{Fore.RED}Poor{Style.RESET_ALL}"

def measure_jitter(uri, count=10, interval=1): 
    delays = []
    url = "https://" + uri
    print(f"\n{Fore.MAGENTA}Testing jitter to: {Fore.GREEN}https://{uri}{Style.RESET_ALL}")
    print(f"{Fore.CYAN}Sending requests...{Style.RESET_ALL}\n")

    for i in range(count):
        try:
            start = time.time()
            response = requests.get(url, timeout=5)
            end = time.time()
            delay_ms = (end - start) * 1000
            delays.append(delay_ms)
            print(f"Request {i + 1}: {delay_ms:.2f} ms")
        except requests.exceptions.RequestException as e: print(f"Request {i + 1}: Failed ({e})")
        time.sleep(interval)

    return delays


def main():
    if len(sys.argv) < 2:
        print("Usage: python jitter.py <url>")
        print("Example: python jitter.py https://google.com")
        sys.exit(1)
    uri = sys.argv[1]
    delays = measure_jitter(uri)

    if len(delays) < 2:
        print(f"\n{Fore.RED}Not enough data to calculate jitter.{Style.RESET_ALL}")
        sys.exit(1)

    jitter = calculate_jitter(delays)
    status = jitter_status(jitter)

    print("\n--- Jitter Result ----------------------------------------------------------------------------------")
    print(f"{Fore.YELLOW}Delays (ms):{Fore.CYAN} {[round(abs(delays[i] - delays[i - 1]), 2) for i in range(1, len(delays))]}{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}Average Jitter:{Fore.MAGENTA} {jitter:.2f} ms{Style.RESET_ALL}")
    print(f"{Fore.YELLOW}Network Status: {status}")
    print("----------------------------------------------------------------------------------------------------\n")


if __name__ == "__main__":
    main()
