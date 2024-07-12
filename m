Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56EEC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:57:32 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.9769.1720796246517396728
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Jul 2024 07:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=HvizIgLP;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.176, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-64b417e1511so20926467b3.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1720796245; x=1721401045; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiP+4gwvA+qTzDMsYAmUUF28fSXL3iN7zJYsLAOu7Nw=;
        b=HvizIgLPDEL0czACqpiCpa+T4eVhWnWhS6BT92qqN9HChokTJf4+Ug9v71Rz58T9Bz
         hs7VBCYaGj547bRUXmf4gd2o7b9X2tMJX8n0qzqqMfIJ5WwVjggwFWiWimPRwDwUd0fx
         e3QjUCR4fitGeK4EAJaB4dvTWXwjWY14OKaTsvXThPVOh+eFxj5SMp9FbXsGsCDvpNR0
         /zyVxRKNC8t74bRmrSdJOOof/kIEiSLITvdkHpn6inxwXyIxGmd9f26LI8vG5HqhNcKe
         7flyTqoA18sCu278BB8FAajeMRiYD2j0f+eDIGlXdmjkIcpwMb6raZKgyQ+ky3/UBaOf
         mXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796245; x=1721401045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiP+4gwvA+qTzDMsYAmUUF28fSXL3iN7zJYsLAOu7Nw=;
        b=dyOztqCQOHW1wi/G8IqA4dMZslQnrHP80FAyiTingU9tgAIuz2Aq2ksORY4qVdVdb2
         t2iu/yikfKLowsBP0N1CvcKpCY4DK/1JXeKjcvC5CVtWNip0rPMl83lo+MuVeqghqc8s
         dqzu4XN0OS9U3S/bJDGlvkuYGUgi95CwPS8tCt7YNQDgFI4HKXFwdg3264U9TStAt1LI
         EMmjgwkb5GSiMK0HG+6Rf/GzQIKvmvD+j1eTITT1kq3k/q1oUf3uomLQVLyMkZJPg1R3
         qnB/8F6tp0PSikj246dYZ11k82uW/uKWXCP+0spSozr0WP93WYAbNhFk+VhhBMyYX8ED
         YcWw==
X-Gm-Message-State: AOJu0YwCNT5AeoYXOrQZdWRZaE9Y/QQZ+iyuIx692Y71WZEqrTM4ZpHX
	dhU0lnvFDckDxfXd5AAgzIEuwvQxqEDyFgnDwdTSDL7Z6XilRArlFNXA6PHdMvbGsRuc/ic0+0c
	=
X-Google-Smtp-Source: AGHT+IGHPrd4OKnGVaSn7AC//7x7Ri48s8hDrRFFbs+pe4RNuFQa5EJm0GFyebcOTZOFcHkqI4JQpQ==
X-Received: by 2002:a05:690c:997:b0:646:25c7:178e with SMTP id 00721157ae682-658ee790c10mr126839467b3.5.1720796245490;
        Fri, 12 Jul 2024 07:57:25 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e68e51bcsm14942407b3.104.2024.07.12.07.57.25
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:57:25 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm/gn: update to the latest commit
Date: Fri, 12 Jul 2024 10:57:23 -0400
Message-Id: <20240712145723.3914014-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240712145723.3914014-1-jon.mason@arm.com>
References: <20240712145723.3914014-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Jul 2024 14:57:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5890

Update to the latest gn commit.  The previous commit was from 23 April 2024.
The commits since that commit are:
    Do not cleanup args.gn imports located in the output directory.
    Fix expectations in NinjaRustBinaryTargetWriterTest.SwiftModule
    Do not add native dependencies to the library search path
    Support linking frameworks and swiftmodules in Rust targets
    [desc] Silence print() statements when outputing json
    infra: Move CI/try builds to Ubuntu-22.04
    [MinGW] Fix mingw building issues
    [gn] Fix "link" in the //examples/simple_build/build/toolchain/BUILD.gn
    [template] Fix "rule alink_thin" in the //build/build_linux.ninja.template
    Allow multiple --ide switches

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-devtools/gn/gn_git.bb
index 2bb29cc3bce7..620f75643a5f 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "f284b6b47039a2d7edfcbfc51f52664f82b5a789"
+SRCREV = "b2afae122eeb6ce09c52d63f67dc53fc517dbdc8"
 PV = "0+git"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


