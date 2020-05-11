Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.12999.1589207186351632589
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 11 May 2020 07:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O2Tao1ug;
 spf=pass (domain: gmail.com, ip: 209.85.166.65, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f65.google.com with SMTP id f4so3438192iov.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 11 May 2020 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DmwRpxgQrazJE/eGJjttf0T2uLrpNq/mX9NyzQX6Mrc=;
        b=O2Tao1ugH7pij6nEMcAPEOVxYv208I3woCDfmF0SSFXtXVDvJK/WUELZ7U7KUxPV1w
         +IJtEsNkK9yGgDtHc9q1f6ZPNOq47wliKxrEM8gyjw0Mha9OutZDermofaMbvxD6XV3E
         JA636fGOmg6Rknsm4PTquL0MFXomK6xfJLsAg6f/iTrU3gD+VhlS/8LvtsG8H2Znm/o8
         6tXb00sTRuxnHUl28M9TUEU0s7yqeO/LC9AdPz7A5vwKQOdqJ2Bf6+HTnIXvEw53kk0g
         TinbY1QNFKLQYr3z1aWMIUVqJ0JW2gbirGj8MXJoS48o1UH8SQpbPpEimztgxCgqj8UR
         8wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DmwRpxgQrazJE/eGJjttf0T2uLrpNq/mX9NyzQX6Mrc=;
        b=fqrE6TwLl9pr46LyHbhtL7rwyeJfh3gZ9jyF1aZbetfp3LNTLMGytQH9S0HsG5DP53
         1xzyquzh4CXQsRlFiTadGG3r6YRvm9YqEdk8ww4a0cQklN+14F2nrTHD/FMXc6lWZ6sU
         sAlD5HzkVN1twkvmG5MpDxoYwDnjRA9bxzEVGfG77OxDnA9k80Ty51F81pf1IzvpHgmV
         YRlhbTwo3PAGUQYLKyHwXI6hxQxLpbHamJfalf0T9fMhPXt/ILW3l5jYkYQzwPanrdfB
         lA5cmC+MwQ6y1FkBeoPQljFpRjYzNPWHm7+pKTbkJxyY46/hxokXy+/66PUQnjH4dK6f
         h34Q==
X-Gm-Message-State: AGi0PuZQCQH/hsYcwq7zz0aX5y+5q3ZachI5SU9VMAqnxOwvOo4HNUW9
	BzKlmk0seiAqNuvB3PiinUyMLy1A
X-Google-Smtp-Source: APiQypJnWKSjRQr23Unq81tJVONYsBiHLm6xbHVPrP3S9FFkexIhxsvFzBEW25UzmKTVgstCKmflZw==
X-Received: by 2002:a02:5b89:: with SMTP id g131mr15750408jab.75.1589207182560;
        Mon, 11 May 2020 07:26:22 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:ac13:ea07:8c16:df2d])
        by smtp.gmail.com with ESMTPSA id a1sm5152256ilq.75.2020.05.11.07.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:26:21 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [meta-arm][PATCH 3/3] trusted-firmware-a: Add recipe for version 2.3
Date: Mon, 11 May 2020 09:26:04 -0500
Message-Id: <20200511142604.11860-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511142604.11860-1-JPEWhacker@gmail.com>
References: <20200511142604.11860-1-JPEWhacker@gmail.com>

Adds a recipe for the 2.3 version of TF-A.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../trusted-firmware-a_2.3.bb                 | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
new file mode 100644
index 0000000..0b66d5e
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.bb
@@ -0,0 +1,25 @@
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
+
+SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa"
+SRCREV_FORMAT = "tfa"
+# Trusted firmware-A 2.3
+SRCREV_tfa = "8ff55a9e14a23d7c7f89f52465bcc6307850aa33"
+
+#
+# mbed TLS source
+# Those are used in trusted-firmware-a.inc if TFA_MBEDTLS is set to 1
+#
+
+LIC_FILES_CHKSUM_MBEDTLS += " \
+    file://mbedtls/apache-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://mbedtls/LICENSE;md5=302d50a6369f5f22efdb674db908167a \
+    "
+
+SRC_URI_MBEDTLS = "git://github.com/ARMmbed/mbedtls.git;name=mbedtls;protocol=https;destsuffix=git/mbedtls"
+# mbed TLS v2.16.2
+SRCREV_mbedtls = "d81c11b8ab61fd5b2da8133aa73c5fe33a0633eb"
+
+S = "${WORKDIR}/git"
+
+require trusted-firmware-a.inc
+
-- 
2.17.1

