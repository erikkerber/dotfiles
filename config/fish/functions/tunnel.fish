function tre
	ssh -N -D 9001 z013sbd@C02ZW675MD6R
	set -x ALL_PROXY socks5h://127.0.0.1:900
	tools/bazelisk shutdown
end