Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.179.1611589292786731244
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Jan 2021 07:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CF4E16F8;
	Mon, 25 Jan 2021 07:41:31 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 033A23F68F;
	Mon, 25 Jan 2021 07:41:30 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] arm-autonomy/xenguest-manager: Make stop by default a blocking action
Date: Mon, 25 Jan 2021 15:41:23 +0000
Message-Id: <20210125154123.12308-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Added -w parameter to xl shutdown to force it not to return until
the action is completed, and modified logging to reflect this

Stop operation can be configured to return immediately using
--nowait parameter, or to force destroy the guest if the graceful
shutdown fails using --kill. Both are now documented in usage().

Issue-Id: SCM-1861
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I664acc8a6a1eb17619fa2fd9b372ea661e537923
---
 .../xenguest/files/xenguest-init              |  2 +-
 .../xenguest/files/xenguest-manager           | 36 ++++++++++++++++---
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
index d580908..c6b0c83 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
@@ -68,7 +68,7 @@ case "$1" in
         # update guest list
         guestlist=$(xenguest-manager status | grep Running | cut -d ":" -f1)
         for f in ${guestlist}; do
-            xl shutdown -w ${f} || xl destroy ${f}
+            xenguest-manager shutdown ${f} --kill
         done
         ;;
   reload)
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
index be2af32..7e5f868 100755
--- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
+++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
@@ -200,6 +200,12 @@ with ACTION being one of:
 
  stop|shutdown GUESTNAME
    Stop guest GUESTNAME (send stop signal and let it shutdown normally)
+   Pass 'stop|shutdown GUESTNAME --nowait' to return immediately, rather
+   than waiting for success or failure to return.
+   Pass 'stop|shutdown GUESTNAME --kill' to force kill the guest if
+   signalling the graceful shutdown fails for any reason
+
+   These two parameters are incompatible, so only one should be passed
 
  kill|destroy GUESTNAME
    Kill guest GUESTNAME (stop directly the guest without signaling it)
@@ -871,17 +877,36 @@ function xenguest_guest_start()
 # Private
 function xenguest_guest_stop()
 {
+    local guestname
+    local extra_arg
+
     guestname="${1}"
+    extra_arg="${2}"
+
+    shutdown_args=""
+
     log info "Attempting to stop guest '${guestname}'"
 
+    if [[ ${extra_arg} != "--nowait" ]]; then
+        shutdown_args+=" -w"
+    fi
+
     check_private
 
-    log_command "xl shutdown ${guestname}"
+    log_command "xl shutdown ${shutdown_args} ${guestname}"
     if [ $? -ne 0 ]; then
-        log fatal "Stopping guest '${guestname}' failed."
+        if [[ ${extra_arg} == "--kill" ]]; then
+            log info "Stopping '${guestname}' failed, calling kill..."
+            xenguest_guest_kill "${guestname}"
+        else
+            log fatal "Stopping guest '${guestname}' failed."
+        fi
+    fi
+    if [[ "${extra_arg}" != "--nowait" ]]; then
+        log info "Guest '${guestname}' stopped successfully"
+    else
+        log info "xl shutdown exited successfully for guest '${guestname}'."
     fi
-
-    echo "Guest '${guestname}' may not have stopped yet. Use 'status' to check"
 }
 
 # Private
@@ -1066,10 +1091,11 @@ case ${cmd} in
         ;;
     stop|shutdown)
         guestname="${arg1:-}"
+        extra_arg="${arg2:-}"
         check_guest_arg ${cmd} ${guestname}
         check_guest_exist ${guestname}
         check_guest_running ${guestname}
-        xenguest_guest_stop ${guestname}
+        xenguest_guest_stop "${guestname}" "${extra_arg}"
         ;;
     kill|destroy)
         guestname="${arg1:-}"
-- 
2.17.1

