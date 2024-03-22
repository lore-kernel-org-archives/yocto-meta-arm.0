Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34849C54E58
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 00:39:57 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.2245.1711067991376452504
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Mar 2024 17:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Q/TZ9UI0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-789d0c90cadso105558885a.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 Mar 2024 17:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711067990; x=1711672790; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iDlzZ8xXaprvmjOa/X7/bwH9XHKZ1n+moCFkOJMWP4M=;
        b=Q/TZ9UI0snvP5+RigefPxIb4dP6yQSkCzFlADD11WPhFoXC4sZxVIeS5j9Xr2EWuoj
         d2FgWzgE6ax5lPNL/LGVidOzU7dZ1tdh4FFGBUB17b/jc2Ez6tHh+99rEe5c+XSPYpbS
         5sRmQWPzL38t0u6xFeqqgMIahCEZI6EyHydcv5Xn8H3P4Vk5ZlsHUdZWf6ZpyimIcEhL
         sigxw3aCjdAhXF3QEaiUiLDMsg7ZoGL8JDiXzfh1+yYdisKxsLvBDGFTRVebIsdi9SVP
         IdSygFok6X1+/enC6hRbhoBNn+zJe9PINvvPjWibg2Eh5GQpDsdMJf26C56FfoaETJUu
         XBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711067990; x=1711672790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDlzZ8xXaprvmjOa/X7/bwH9XHKZ1n+moCFkOJMWP4M=;
        b=lHqzNxXnEMQL+2C4K9M9RY1whKItGgUX65TaaRjsBllbcRAVfpbjeWZKG8JissAtp4
         eGUX9k0FmNGO/AJVbP/WHo4UOn7AbeAUj989PmCVI3PJfBIKJkXyRwLG/ZWvYtA/kI5E
         SgP7B+ECThJIcO+y/gE2cmnN/CisJvFHuuaxIJUUOdpT0xd02TTD6ETWmUrnAYcxmbsC
         9JJNrAcjbSyYfz6Cx3kAFN5NV6+TlizbunbCM9usrojW/PdizfUx5RlmiFmKXlXo77VE
         7kULcvb+0L5RZ1fIE77Zh6kwkPqjeMa/l89AFOKIINSL61QnAFFSCv4VkjB3CIXjEDEj
         miPw==
X-Gm-Message-State: AOJu0YzeOB+BcM9Ffy/bJpJrbzML9Z1Zh2algVt9CE1UY+AnGyYV1Dro
	lsEH9Y1+/ep4OLp4EnpjsDY03fTcgnqvEYGOpBAibvQFh4YHlIWXnlwm8FunjmvfASYV4sUn0IU
	=
X-Google-Smtp-Source: AGHT+IHX/nTvsSntC7id8HXJf1Ub9+w8BVxMdDWGX+J7tsquXjqaYddmPHwlPgb8IqdIRTppecFJqA==
X-Received: by 2002:a05:620a:10a9:b0:78a:7ad:bb16 with SMTP id h9-20020a05620a10a900b0078a07adbb16mr716520qkk.59.1711067990293;
        Thu, 21 Mar 2024 17:39:50 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id i11-20020a05620a248b00b0078a310ae98asm364094qkn.77.2024.03.21.17.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 17:39:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/scp-firmware: update to v2.14.0
Date: Thu, 21 Mar 2024 20:39:28 -0400
Message-Id: <171106796971.3094308.2046265030829004626.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240321143425.85379-1-jon.mason@arm.com>
References: <20240321143425.85379-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 00:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5481


On Thu, 21 Mar 2024 10:34:23 -0400, Jon Mason wrote:
> Update to the latest version of SCP.  In this release, some of the
> platforms were grouped into common family directories, which
> necessitated adding a variable to specify which one.
> 
> 

Applied, thanks!

[1/3] arm/scp-firmware: update to v2.14.0
      commit: 5705ede03d71bb65f62c6c9c5be3378f154d19d9
[2/3] arm-toolchain/gcc-arm-none-eabi: remove 11.2
      commit: 81e3864bee2ee7212baf239d0a6f5e09698a6438
[3/3] CI: reduce coverage of dev kernel
      commit: 0aeec5472ced93b403356d310ec78d572199cf0b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

