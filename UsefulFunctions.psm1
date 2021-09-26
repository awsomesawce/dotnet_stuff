function paket {
(gcm dotnet -erroraction ignore) ? (dotnet tool run paket -- "$args") : (write-error "Dotnet not installed")
}
