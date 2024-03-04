Return-Path: <mathieu.poirier@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C44C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 23:16:50 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.8302.1709594202671176432
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 04 Mar 2024 15:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dC/peZu7;
 spf=pass (domain: linaro.org, ip: 209.85.210.179, mailfrom: mathieu.poirier@linaro.org)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6092a84f4so1488358b3a.0
        for <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 15:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709594201; x=1710199001; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LGw7xmrmIkHlOy+FsDTNYigbTlt9YZ+aNIF053XWGbE=;
        b=dC/peZu7VRaJml9gK8y4c2WFVRRQFXImsRHrAOKwnUN/xdziYRGuwdQTkxKxqxZ0fT
         A6QuH4E+M3qdumPsq4L6kCUeE1kFwMVcohd3jGQWgXruSJWTiXBj0u/bc/P1cR/e5W6a
         20oUjfazSlXPG647YE4+zbUy9Wl6vimshkEXfjyS/w/iAHPxc1BGrHuf5BR4vfOPajB+
         MAe2vmj3ESYqJhjotNGWjZkreNu4o2TvFvjhn0TncXkaKtyZm0DWlUJnn6z3AmQgruy1
         jmK3g46AjgvUA4q9j6DpkkthKPs9CjZL51IzAfYDUNe5Qas2a6/OdrF+djzeftbCZUVm
         4NQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709594201; x=1710199001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGw7xmrmIkHlOy+FsDTNYigbTlt9YZ+aNIF053XWGbE=;
        b=RHauUTCj7Ag17f/cVO/N6rsyOJjHJxI6hE83ZXeHuE4lsR6S4gnfWhUyWqq37oy7ra
         DBPbpOp+Tjoe1zeKXiCbylpTJ2vBmV2DyLB3DFnd8a+pAyYLv0pSlYLgxO9XJusb/Zl0
         LuWRk8z0QVHoWxoWGbmG2P/QyIyq6fovrTQNEzfgNgYOj4CYVG/Gmz+w/GxbI0zT5lSa
         VOIl32VuShWgGKuN4Xrdh7ONSO/fNJ8a7TGMYG9ow3IN302NIXpnZxEoiZi5TCE2Fd40
         8Kf9Qop5A5wtkag63SaC4GxEt4CcKeb3uPiHBYa6yy5TGojhKXNkxg4eNQlj6i1ikPOI
         Oo0A==
X-Gm-Message-State: AOJu0YzmnPxrpEklqWEjjIhaynssBcLtlykWoSpJyxDJJizn0v29jVZi
	czqrjO0HdxTOUuxHtkne2KvU8v/X5yi64fUuZsl/H4DBNggYZbsd0GpjkLBztuDHk2EeYuHDdi2
	D
X-Google-Smtp-Source: AGHT+IFoWABrkZaLE6n44c6BduP+rAQePYPj+wt7hzGmH92uqC8uLOtT3UrGxteUgWz8/bX3iPeUlA==
X-Received: by 2002:a05:6a20:3812:b0:1a0:cd54:6d9f with SMTP id p18-20020a056a20381200b001a0cd546d9fmr123529pzf.23.1709594201055;
        Mon, 04 Mar 2024 15:16:41 -0800 (PST)
Received: from p14s.. ([2604:3d09:148c:c800:164d:f5c6:5814:1e78])
        by smtp.gmail.com with ESMTPSA id d14-20020a056a00198e00b006e63961c058sm162042pfl.216.2024.03.04.15.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 15:16:40 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: mathieu.poirier@linaro.org
Subject: [PATCH 0/1] Support for Arm RMM Firmware 
Date: Mon,  4 Mar 2024 16:16:38 -0700
Message-ID: <20240304231639.4187147-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 04 Mar 2024 23:16:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5410

Hi all,

Please see enclosed attempt at introducing a recipe to support Arm's RMM
firmware.

I am new to Yocto/oe and hereby submitting my very first recipe - let me
know if you want something modified.  

Compiling this recipe yields the following warning:

"WARNING: rmm-1.0-r0 do_package_qa: QA Issue: File /firmware/rmm.dump in package rmm contains reference to TMPDIR
File /firmware/rmm.elf in package rmm contains reference to TMPDIR [buildpaths]"

I would appreciate some guidance on how to get rid of it - I looked far
and wide with little results.

Thanks,
Mathieu

Mathieu Poirier (1):
  arm/rmm: Add bitbake, include and patch file for RMM firmware

 ...Add-repositories-for-system-includes.patch | 45 ++++++++++++++++
 meta-arm/recipes-bsp/rmm/rmm.inc              | 54 +++++++++++++++++++
 meta-arm/recipes-bsp/rmm/rmm_1.0.bb           |  5 ++
 3 files changed, 104 insertions(+)
 create mode 100644 meta-arm/recipes-bsp/rmm/files/0001-CMakeLists-Add-repositories-for-system-includes.patch
 create mode 100644 meta-arm/recipes-bsp/rmm/rmm.inc
 create mode 100644 meta-arm/recipes-bsp/rmm/rmm_1.0.bb

-- 
2.43.0


