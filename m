Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.987.1612462453852816513
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Feb 2021 10:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300B9143D
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:13 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D27763F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  4 Feb 2021 10:14:12 -0800 (PST)
From: "Jon Mason" <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/6] gem5/gem5-m5term-native: initial recipe
Date: Thu,  4 Feb 2021 13:14:03 -0500
Message-Id: <20210204181405.20275-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204181405.20275-1-jon.mason@arm.com>
References: <20210204181405.20275-1-jon.mason@arm.com>

From: Adrian Herrera <adrian.herrera@arm.com>

m5term enables users to connect to the simulated console. Useful in
development environments.

Change-Id: I6096be9fbf44da280272656f3e15d1ba19593e50
Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../gem5/gem5-m5term-native_20.bb             | 24 +++++++++++++
 .../gem5-m5term/0001-add-makefile-flags.patch | 34 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
 create mode 100644 meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-makefile-flags.patch

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb b/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
new file mode 100644
index 0000000..07faddb
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5term-native_20.bb
@@ -0,0 +1,24 @@
+require gem5-source_20.inc
+
+SUMMARY = "m5term allows users to connect to gem5's simulated console"
+HOMEPAGE = "https://www.gem5.org/documentation/general_docs/fullsystem/m5term"
+LICENSE = "BSD"
+
+inherit native
+
+M5TERM_DIR = "util/term"
+
+SRC_URI += "file://0001-add-makefile-flags.patch"
+
+do_compile() {
+    oe_runmake -C ${S}/${M5TERM_DIR}
+}
+
+# The Makefile for m5term does not provide a "install" target
+# We do the install process within the recipe
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${B}/${M5TERM_DIR}/m5term ${D}${bindir}
+}
+
+addtask addto_recipe_sysroot before do_build
diff --git a/meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-makefile-flags.patch b/meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-makefile-flags.patch
new file mode 100644
index 0000000..d13ef4c
--- /dev/null
+++ b/meta-gem5/recipes-devtools/gem5/gem5-m5term/0001-add-makefile-flags.patch
@@ -0,0 +1,34 @@
+From 688f7103e08318edbd48cf830c0ab3a048761bbb Mon Sep 17 00:00:00 2001
+From: Adrian Herrera <adrian.herrera@arm.com>
+Date: Thu, 03 Dec 2020 16:45:59 +0000
+Subject: [PATCH] util: m5term, fix LDFLAGS, standard make variables
+
+Enables build systems to provide necessary flags to build m5term.
+Useful specially if a different linker is intended to be used.
+
+Change-Id: If7f867cc0965d6ad4627b5421e00a99cc3d64989
+Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
+
+Upstream-Status: Accepted [https://gem5-review.googlesource.com/c/public/gem5/+/38256]
+Expected version: v20.2
+---
+
+diff --git a/util/term/Makefile b/util/term/Makefile
+index 658b961..4aa1c52 100644
+--- a/util/term/Makefile
++++ b/util/term/Makefile
+@@ -24,12 +24,12 @@
+ # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ # OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+-CCFLAGS= -g -O0
++CFLAGS ?= -g -O0
+ 
+ default: m5term
+ 
+ m5term: term.c
+-	$(CC) $(LFLAGS) -o $@ $^
++	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)
+ 
+ install: m5term
+ 	$(SUDO) install -o root -m 555 m5term /usr/local/bin
-- 
2.17.1

