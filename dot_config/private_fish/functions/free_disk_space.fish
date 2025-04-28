function free_disk_space 
	find ~/.bazel/disk_cache -mtime +2 -delete
	chmod -R u+w /var/tmp/_bazel_* 2>/dev/null && rm -rf /var/tmp/_bazel_* || true
end
