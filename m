Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.19039.1594731888134300836
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2020 06:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=0qjn4oEX;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id 17so5808050wmo.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2020 06:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n4lp0PnxRZ3Rpb8Ao3vv/DWLf4oo6FE+19FBkNXRHco=;
        b=0qjn4oEXW78CKv1XvkX612zPoWwEyH1vHYwxlbzNA9cmxgUqf2u49HnvUeWYnbqw4r
         +vSbG5eWhQyPuPgTYKEVB7Zxq2Li3TkYKAOSD+CdxArW3hZr4CiwpCw4DUQzAOfCjxRT
         Rs1F0mp/x0xUD5V4ED2Jyz0dK57s2f+7c79l44jPveMTmWdiK1qLjUwAAoO8x2QC9Rxu
         nseJFDgP+Nb9HT4Zp5bUk0iuQNP+BTDN6/kCRyuUh0mbMGp2bz5nsdtiJJETurE8QG2m
         +psGPGIDiNv+aNPKR6MGLA1Yrj1M2yipNCL2Mps0mswgMpcI7kSJVkQQN3VbtyQvK19f
         G9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4lp0PnxRZ3Rpb8Ao3vv/DWLf4oo6FE+19FBkNXRHco=;
        b=rR64wCV9If1thE5WJLKkmQIkc3cfDn93VRECqxvwlRkYBAeiYdOsXzA8tWoqzPnZTW
         OhZay2c86pmeW9mWwkrEgArLF63aSi+RrChTg35uycbwKq7cBydFas4uf10I3Y0Kogld
         pw+4UcKAMkYc0ddguw1J58YdJr/44TYsG9jzx3u6osSdgLb9kyDoy8hd//Rx0YP3UWEA
         tYmJSj+/ObRcjGkXyCo45Q8mp7Xf7fSeWDn5BGRtzblmLRvxsiJI7Py3bcrZkhaxEpVY
         kdq7FCHDAbC5sWW/W6HfSS5VMx1NNhha7G3QH3+fxTtJCeT6jeOvAoK/FhsyZqclorpo
         DmDg==
X-Gm-Message-State: AOAM532P2lMHV2UlMPkwdeXW0BM5MGG0S/uPG5Dmg6g6NirYfWiyvset
	2f1dc+vrfChfZu6mqO+V0Q5IavoZhFc=
X-Google-Smtp-Source: ABdhPJxkEC5JGT+r/8jodB7066rLvYn5LUCmsjuRZ/NhotornJVAddVBTdTYQjkWSKcY7pOKaKmmsg==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr4419902wmg.93.1594731886271;
        Tue, 14 Jul 2020 06:04:46 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h13sm4469831wml.42.2020.07.14.06.04.45
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 06:04:45 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] opencsd: upgrade to 0.14.2
Date: Tue, 14 Jul 2020 14:04:42 +0100
Message-Id: <20200714130442.580205-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714130442.580205-1-ross@burtonini.com>
References: <20200714130442.580205-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Change-Id: Ic66533674e10b7c8cb71f9f49d907af1aac47e44
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_0.12.2.bb => opencsd_0.14.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_0.12.2.bb => opencsd_0.14.2.bb} (94%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
similarity index 94%
rename from meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
index f1d4cac..f321c7d 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_0.12.2.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_0.14.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad8cb685eb324d2fa2530b985a43f3e5"
 
 SRC_URI = "git://github.com/Linaro/OpenCSD;protocol=http;branch=master"
-SRCREV = "03c194117971e4ad0598df29395757ced2e6e9bd"
+SRCREV = "afdea70b2cafa20837703c387d33cd6776c6d16a"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

