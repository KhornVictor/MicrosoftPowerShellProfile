def decimal_ip_to_binary(ip_address: str) -> str:
    octets = ip_address.split(".")

    if len(octets) != 4:
        raise ValueError("Invalid IPv4 address format")

    binary_octets = []
    for octet in octets:
        value = int(octet)
        if value < 0 or value > 255:
            raise ValueError("Each octet must be between 0 and 255")
        binary_octets.append(f"{value:08b}")

    return ".".join(binary_octets)