Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE15BC0218F
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:35:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.18075.1738251303960063299
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Jan 2025 07:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yVwK9eRl;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540215984f0so1044049e87.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 07:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738251302; x=1738856102; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=yVwK9eRlbyBG6F1799kNRsJImAhzOP49gxPeQgwdnRk94VARAi4aXlQoRlvf6sDdF4
         gEkK/bXk2vFhSvk1RQnFrv3f2TZkyxxq+gF+DW1NITiiL5LaA3Z1/NeKDyozHHF+/Li8
         N4DdaecXPuHXzhXPvYCJ0/3EYkfjbXcrDwTXF1bvModGTREx2XU8ah6UIJmdGS3U4al4
         gS3RGYpG0lAn25WIxG0cBjjHcKmt2MODEsEwNpDi+sFD9tS2/PNWTfbBJqIdruqJIPoJ
         dMGqDmdjSOGYYWCeCfbwWzj9cLp6Zzxd2Ykf7y6woADAXtlR+qN/mFibr/PnQJtlwTPw
         i9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251302; x=1738856102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=VSiGxrf+1z2RZ5pHE3txZvR38uG32VLmTiYhj39Cv842fvBGJnUpdnPQsZ73ccy0zd
         dmrCFCRf7PYxGxRqUqwivaJauAItAov3ZrTwUk3TYh3TqqFAcIOHflIJ+YGbITtjKb4u
         hNWAi0Gy1J1uJFloyenLfHy/c7ImrI/y5N7ygv0kFDtBHUw4V3NW1i+GmVt4hY154F7V
         zI4uVGCq+4amwITyrK89r8TZD65SvgS5hDc6xg4V1r4+Dzr+8zCAWueoXunlQRYYp17K
         f82QZHPgOK5Ydy/SRIE6/IF5BJ8C46dfxAqg95fqVhGSZzQk5w4Cshydd2EwseJEr0OJ
         6MzA==
X-Gm-Message-State: AOJu0Yxg4UmJ2Ao1XT7K8t4n3yKowS/NOETEm/hACbHpozxghLO+9Pdd
	Cfuzs8UNCA0aj0tnmlHdLRYxODiBf/MG4IM/nfAPundGhg1c6vBYv+AAC1cJ7IM=
X-Gm-Gg: ASbGncthxmvUm37V2AVP9JUYuRwNEpbXjLgnPIq3Ir/WKoX04enQPvK7oQO0osQ8fKe
	A5YC6iji0/P3Du67VXLyO3elSdS3FozbCAmM38WKkBaJb9i5/qdCP0/28AFqmt4bMc0L8Nm04Vw
	mArRDTPzg/TD6NaqaCC+OwOJ2riWRcvWOkvXEPj0mdFaPRi8okg/SeoTmgi9A76SjPolcsJKPbb
	PGcGzvY8S0nwYGvHky7ucnqW8QTS8rShX/BPztU+/UPCi3Ak3mzd3hYfBFM8AP1URU9ZoioK8Nu
	Cvv/w6q0Hzv6Xu9YmaCJMqasmcAQG00PKQTyRT/RB9s10/YsJHi1RN5J2poz
X-Google-Smtp-Source: AGHT+IHgkmGjOB3O+cjTK4w1rHwRsHs90fQDPtqMFRkAThMeV141H4QCMIbzqrc5tZEWaVW/qRj1Pg==
X-Received: by 2002:a05:6512:3409:b0:540:1b7e:7b3d with SMTP id 2adb3069b0e04-543e4c37a7emr2767687e87.36.1738251301779;
        Thu, 30 Jan 2025 07:35:01 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebecc3sm186125e87.242.2025.01.30.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 07:35:01 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: meta-arm@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/3] systemd-boot-native: undelete but disable configure and compile tasks
Date: Thu, 30 Jan 2025 17:34:33 +0200
Message-ID: <20250130153435.1074941-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <181F17E3A23753E5.21193@lists.yoctoproject.org>
References: <181F17E3A23753E5.21193@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Jan 2025 15:35:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6360

The tasks were deleted and do_patch() was run after do_install()
which means that patches applied in SRC_URI were not in the
ukify.py binary installed. Mark the tasks as noexec since
they don't need to do anything.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 58db408dcf..5b4b63c294 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -2,13 +2,12 @@ require systemd.inc
 
 inherit native
 
-deltask do_configure
-deltask do_compile
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install () {
        install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
 }
-addtask install after do_unpack
 
 PACKAGES = "${PN}"
 
-- 
2.43.0


