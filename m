Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.4059.1586413787727932350
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 23:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dzHjcloY;
 spf=pass (domain: linaro.org, ip: 209.85.216.67, mailfrom: sumit.garg@linaro.org)
Received: by mail-pj1-f67.google.com with SMTP id kx8so860720pjb.5
        for <meta-arm@lists.yoctoproject.org>; Wed, 08 Apr 2020 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JXTOp9Qe20PA7jn9jhGBp863h+EyKwbc1NO4El1NUe8=;
        b=dzHjcloYTE+0WjxkMEauOlojC8bl1787i+oiJykJHo1NL/+tnEZWpuNuQCf6Lnp0Ux
         HP7Me55aFZ7DpdDNILC4krpzOLqfq9E7Dhyng0ZtSL/WOVdSxUZ23fhCylNI335Hboxq
         RnU5Pm8xipGYrTdtYc7mFFbPeh7ErtRPpmMN8FAqziYn6S1FshM3rpL3yXC6lfjfywnI
         s8HPJGN4fd7Ajdnqqe/WjQBLp4jQhKKgnSB6y7J7b51W/gPJYPd3HIu5n2k9dwqmp7O/
         qEMZ1XDYGZYOWXUIvTnYshBZiEqhuCeOlEGTnREcqpkenDVt+aX6ogH5VZguuuSwNpc6
         a8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JXTOp9Qe20PA7jn9jhGBp863h+EyKwbc1NO4El1NUe8=;
        b=UVSEq3NJcuOigiBHmM9RKBt/u7aXOxajBHgCaWopiqGrSUPqLIQjk1OULbo8Pjbz15
         aFEEQ9jTnhFjHT4KV55u7e1i7pHYdXaY3coWOWvKgzFhdIP9hHaZesrrVHtqKvynLDPa
         9Cs/f0es3ATBn9j/O+Kq3GqsysY+6aI7W7aI3TAAnMxJt7YPJH9OJaSfBgqA6dCQab47
         de6eNqAA5JN9PrAyEv5kMbKogP+CdGJ/Mddx7W1TrsnRqZXdVaonfjzzDmaVhWhms1WE
         kbVFdwx71ScKy/TKqJoYm2gjUXvDkIpvL4tOA+YJDX/Kzel2uIzcbCn34Q7qDgkXFDIA
         A9MQ==
X-Gm-Message-State: AGi0PuZHL+tw4n2NnbygBta3kaRqZACF0rjCXWduUb4OVYpbU3ux6+bD
	Q46BKpQSZFgwtPDWDwECIw4zEiUI4C8=
X-Google-Smtp-Source: APiQypJakvdnCs+bsBIWBkyu/xXgd+fPa4d0l+fkb/LyQh/n1vmMr+rnArVk/wigewj3+U6Mt5ZSQQ==
X-Received: by 2002:a17:90a:b395:: with SMTP id e21mr9948277pjr.33.1586413786682;
        Wed, 08 Apr 2020 23:29:46 -0700 (PDT)
Return-Path: <sumit.garg@linaro.org>
Received: from localhost.localdomain ([117.196.230.86])
        by smtp.gmail.com with ESMTPSA id o12sm1238996pjt.16.2020.04.08.23.29.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 23:29:45 -0700 (PDT)
From: "Sumit Garg" <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	nicolas.dechesne@linaro.org,
	riku.voipio@linaro.org,
	denis@denix.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] meta-arm-toolchain: use GCC 9.2 source tar ball insted of svn
Date: Thu,  9 Apr 2020 11:59:32 +0530
Message-Id: <1586413772-31763-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4

GCC 9.2 source fetch from svn is quite slow as compared to source tar
ball. So switch to fetch GCC 9.2 source tar ball instead.

Reported-by: Riku Voipio <riku.voipio@linaro.org>
Suggested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
index 366a070..08e8f7f 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
@@ -27,10 +27,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8 \
 "
 
-#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#RELEASE ?= "5a5ca2d"
-#BASEURI ?= "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar.gz;downloadfilename=gcc-${RELEASE}.tar.gz"
-BASEURI ?= "svn://gcc.gnu.org/svn/gcc/branches/ARM;rev=277439;module=arm-9-branch"
+BASEURI ?= "https://developer.arm.com/-/media/Files/downloads/gnu-a/9.2-2019.12/srcrel/gcc-arm-src-snapshot-9.2-2019.12.tar.xz"
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -71,7 +68,9 @@ SRC_URI = "\
            file://0036-Re-introduce-spe-commandline-options.patch \
            file://0037-Fix-up-libsanitizer-build-with-master-glibc.patch \
 "
-S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/arm-9-branch"
+SRC_URI[md5sum] = "9c570fc4286825b4e6f67b3d34aade23"
+
+S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-arm-src-snapshot-9.2-2019.12"
 
 # For dev release snapshotting
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/official-gcc-${RELEASE}"
-- 
2.7.4

