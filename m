Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.10106.1584515952769727866
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 Mar 2020 00:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=s+74RcP2;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: leo.yan@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id d1so405530wmb.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 18 Mar 2020 00:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=F6uvosDv2Q4dc7gIMjKyG54p4XOii1HoF13agIz0Kb8=;
        b=s+74RcP2TXgV/SRzie0F7kafmLc3oaO0YrXOoYsvjIW+2XrFISeq8QP6cLbzylc/gz
         0JM+9vEqF3G3GbBdLu5jdGbfoATpI+uzLdVvk+D8fcDpZEbs2vWIxkOHLQgwdabvR7H7
         4yjHo1sjItrVt8idhn1xqczeh2A+GllpkoR6UlL3ptu2U3gVSwN6KjTnUOrbzMgLVPiN
         AedXphJI8YihT12tYDVsRO4zyBfnpX5qH5EbOSbCeW9H1oRYV6Dze38SqrEU0Z0gp+Fy
         3ikwDEVAo6cT1RXoqEUfP4NLgefBeWuUDTqSy/TDKULnuB1fFAePl0Du7GTvCQ31rXp7
         0ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=F6uvosDv2Q4dc7gIMjKyG54p4XOii1HoF13agIz0Kb8=;
        b=b5MwaSztK5b0M8c1GuLj4AxzOdiWpJ1bgLOEENOcis2ToGoeNQS+VWI/yjkeH3drQB
         t02d6PBI62kcjeyCOy5ohauso0G/CO5Olvc61fn/myO6H1ErrMZ8C+JSxI3Zqt1kJADA
         VP68kHdKCP1niV2jExEJnWsDbeUaP3X+yLCu85ikgyb7O6QspN58n8SKG4t79MbIxJZ4
         JrcSZ9Ch1ioY1w9hhvtt00bjGCEALW6WNzuNe9TkZSliv2F4XgxkjGEgLe2W+/pfHZRB
         19SQok94ChtuoUgkksUTfXZKLjHpt6lXQLO1cZHQw85GqnhJ9QmV/CG73oq4f4zZ+LIq
         vXGA==
X-Gm-Message-State: ANhLgQ0MDOEWF7QCN5L99/f9RtRf/CG2rHZAvJ4AShkdsgxjTwWEY86I
	Tg+w2bB23WEdqkK+1cRamuKomhozKOW/Cg==
X-Google-Smtp-Source: ADFU+vtD6qYtWpHLSXvDgjjF1/JOuf72ssiAclh3ehirmI5BDodaRDxDA9ybS9aiBBR6T9mhf0Gx1Q==
X-Received: by 2002:a1c:ba06:: with SMTP id k6mr3386591wmf.136.1584515950922;
        Wed, 18 Mar 2020 00:19:10 -0700 (PDT)
Return-Path: <leo.yan@linaro.org>
Received: from hackbox2.linaro.org ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a73sm2534954wme.47.2020.03.18.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 00:19:10 -0700 (PDT)
From: "Leo Yan" <leo.yan@linaro.org>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>,
	Scott Murray <scott.murray@konsulko.com>,
	Jon Mason <jdmason@kudzu.us>,
	Mike Leach <mike.leach@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Leo Yang <Leo.Yang@arm.com>,
	nd <nd@arm.com>
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3] OpenCSD: Support for Arm CoreSight decode lib
Date: Wed, 18 Mar 2020 07:19:01 +0000
Message-Id: <20200318071901.28503-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1

This patch is to add recipe for OpenCSD, which is an open source
CoreSight trace decode library and utility.

Also create a new folder recipes-devtools under meta-arm to place
this recipe.

v3: Added support native building (Bertrand Marquis).

v2: Refined recipe to use '-C' make option so can catch make error
    (Bertrand Marquis).

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../recipes-devtools/opencsd/opencsd_git.bb   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-arm/recipes-devtools/opencsd/opencsd_git.bb

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_git.bb b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
new file mode 100644
index 0000000..f1d4cac
--- /dev/null
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "OpenCSD - An open source CoreSight(tm) Trace Decode library"
+HOMEPAGE = "https://github.com/Linaro/OpenCSD"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
+
+SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
+SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*)-linux"
+
+EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
+                CROSS_COMPILE='${TARGET_SYS}-' \
+                CC='${CC}' \
+                CXX='${CXX}' \
+                LIB='${AR}' \
+                LINKER='${CXX}' \
+                LINUX64=1 \
+                DEBUG=1 \
+                "
+
+do_compile() {
+    oe_runmake -C ${S}/decoder/build/linux ${EXTRA_OEMAKE}
+}
+
+do_install() {
+    oe_runmake -C ${S}/decoder/build/linux PREFIX=${D}/usr install
+}
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

