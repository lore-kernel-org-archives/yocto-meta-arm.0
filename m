Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.11520.1592316850761661160
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 07:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=bdNWQUdm;
 spf=pass (domain: burtonini.com, ip: 209.85.128.67, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f67.google.com with SMTP id r9so3040301wmh.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jun 2020 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FT18PVo2toIFOkWcrNAXN5W5jEvN++NRxlVeK4kRQWA=;
        b=bdNWQUdmXhkbHvgJJjgvD+0hn6c9zeoJ5srrFOF1YNxMZK/Ixud/dD/t4yfK9oOaDZ
         keKjEb15ZWhyk1WV35Zg1836wYkYe9skTcjgE9YdSQ61/3w8ONQPVtxnHksMqpMH7Qjn
         vqHa6Q4RU1e46J/InpMX1tv1ZthZw1VelGs6mZMaVtQgwzqcUe08v/MvEh1WzSBKevnP
         dhVneWwEUkxyZupuH5lvXyQzVzPTsBbZSzLfv69eg1V9f8cc8zHYlVNu4TTjJ2dI5IU3
         xnubsxx4JaUjWw688tHSQhDGQi/pRbDbQEnMTnKDGIoo0wgwIval24yB2xtFYHrNzBa9
         BF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FT18PVo2toIFOkWcrNAXN5W5jEvN++NRxlVeK4kRQWA=;
        b=crH9vbN+RXBDwPLqDPPHSaARpIshbiOnYqalKkYIUt63bVWXOrGcz92iCEQbGUTWcZ
         JBY78AXstzpPMTQ/SDR3vnhsKeoHOswkfdZ7+mkg/VI8n2eeLjcSEOFokiPvNM1LZIs2
         YxtlF4Svy3ihyF9jdjijtAmFdlzJFnN/fFN7S0Zm0NsIC4MFeeCoADEzBQLxM4LMGP1V
         j8duJPFYAke1JDSS+27wgryYH5Gw0LWqwnMpIH+vc4KXQouJ5Svlq9SV+KMUd2iqymIp
         laf+cdRrYHCCLyHqoZu3X/Q95Sd9upzuIBQ8vjydRezHf5EbWZVrTJxjrBcJA4nGnx3i
         PN5g==
X-Gm-Message-State: AOAM5304s15j7+AZ1ETS+CGH4FGEtaMTy5eAG1hUL0JLgCbIiSvJPm6A
	fj7kLo64VizF+SN5GlscGG+DwsBhWZujOQ==
X-Google-Smtp-Source: ABdhPJxSZkYcTgvmg2XedNs1BwqKJcCcKZPXaLYogBL/K0oPrRlnnIN+BCxdVmLPsGVbJQIMndB0Ew==
X-Received: by 2002:a1c:2045:: with SMTP id g66mr3402589wmg.53.1592316849137;
        Tue, 16 Jun 2020 07:14:09 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 104sm31057376wrl.25.2020.06.16.07.14.08
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:14:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] README: add git-config example for git-send-email
Date: Tue, 16 Jun 2020 15:14:04 +0100
Message-Id: <20200616141404.1046832-3-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616141404.1046832-1-ross@burtonini.com>
References: <20200616141404.1046832-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 README.md | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index d29e1a0..0546642 100644
--- a/README.md
+++ b/README.md
@@ -25,7 +25,9 @@ Currently, we only accept patches from the meta-arm mailing list.  For general
 information on how to submit a patch, please read
 https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
 
-E-mail meta-arm@lists.yoctoproject.org with patches created using this process.
+E-mail meta-arm@lists.yoctoproject.org with patches created using this process. You can configure git-send-email to automatically use this address for the meta-arm repository with the following git command:
+
+$ git config --local --add sendemail.to meta-arm@lists.yoctoproject.org
 
 Commits and patches added should follow the OpenEmbedded patch guidelines:
 
@@ -40,8 +42,7 @@ The component being changed in the shortlog should be prefixed with the layer na
 Reporting bugs
 --------------
 E-mail meta-arm@lists.yoctoproject.org with the error encountered and the steps
-to reproduce the issue
-
+to reproduce the issue.
 
 Maintainer(s)
 -------------
-- 
2.26.2

