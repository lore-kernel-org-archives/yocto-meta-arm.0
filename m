Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4445.1596623821622325923
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 03:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@andersdellien.se header.s=20191106 header.b=2msfX3Hw;
 spf=none, err=permanent DNS error (domain: andersdellien.se, ip: 46.30.210.182, mailfrom: anders@andersdellien.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=andersdellien.se; s=20191106;
	h=references:in-reply-to:message-id:date:subject:cc:to:from:from;
	bh=ggNeDPNzEnhNrPIQi743OLHEFqAw08BIDEpIrOBd5Y8=;
	b=2msfX3HwJ4ECVs7xUjFpN1ksDUWQGkajAS6skEXvw3jyuEov0jCQHPVAije2sq3RBamls2t1Yufuh
	 S8a0Kymu2mxRoUUf/3c9zIkDtuzUPWaNQsJa6n/NXwvyspBuAk0ekskvfkwqYMkUEk12J7rYTg6Fl4
	 R9BA41GUrET+cbef5gVK/WM8VHu8pZ55QbQbSRNBOX3t5izh/D/tXr1/LoS5+GQTWXkobyFw+20Gay
	 Tor7DjvS5gtGjrfQdq6wODcXzut9S5HPT1I70RbOahdaqSbSv5YOIwaAKPEFCkGwrnM/RhvoVkeB2Z
	 fAYdWMAOHEXxmg4TvymSiMQjAdXLZvQ==
X-HalOne-Cookie: 7e7c11d253d3ff3bf9d1e23bb23b9e60c3a723e3
X-HalOne-ID: 97c8f9ac-d707-11ea-b2e9-d0431ea8a283
Received: from e110568.arm.com (unknown [90.255.41.247])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 97c8f9ac-d707-11ea-b2e9-d0431ea8a283;
	Wed, 05 Aug 2020 10:37:00 +0000 (UTC)
From: "Anders Dellien" <anders@andersdellien.se>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2 2/3] arm-bsp/trusted-firmware-a: Add support for 32-bit FVP_BASE machine
Date: Wed,  5 Aug 2020 11:36:12 +0100
Message-Id: <20200805103613.544-2-anders@andersdellien.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805103613.544-1-anders@andersdellien.se>
References: <20200805103613.544-1-anders@andersdellien.se>

From: Anders Dellien <anders.dellien@arm.com>

Change-Id: Ia2b51de62564ed3f1489d749c0e7d78459fda993
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../trusted-firmware-a-fvp-arm32.inc                 | 12 ++++++++++++
 .../trusted-firmware-a_2.2.bbappend                  |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
new file mode 100644
index 0000000..5684802
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-arm32.inc
@@ -0,0 +1,12 @@
+# Armv7-A FVP specific TFA parameters
+
+COMPATIBLE_MACHINE = "fvp-base-arm32"
+TFA_PLATFORM = "fvp"
+TFA_UBOOT = "1"
+TFA_BUILD_TARGET = "dtbs bl1 bl1 bl32 fip"
+
+EXTRA_OEMAKE_append = " \
+    ARCH=aarch32 \
+    AARCH32_SP=sp_min \
+    "
+
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
index a87999f..81138d3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.2.bbappend
@@ -2,6 +2,7 @@
 
 MACHINE_TFA_REQUIRE ?= ""
 MACHINE_TFA_REQUIRE_n1sdp = "trusted-firmware-a-n1sdp.inc"
+MACHINE_TFA_REQUIRE_fvp-base-arm32 = "trusted-firmware-a-fvp-arm32.inc"
 
 require ${MACHINE_TFA_REQUIRE}
 
-- 
2.17.1

