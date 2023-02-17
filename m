Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AF5C64ED6
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:21 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.261.1676608278848823953
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=iwWSecLz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id w3so4354202qts.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYebvLPMU4hBXOXp944000DHj7RiZPclYhzhh48nuVM=;
        b=iwWSecLz6PAS1UK2YrfzyJYLlKZzEea5fiSP5OYSNBJR9UhdDwgsCqnhFS3hOgcogJ
         R6NH7RWtPmT6qzVLSJRgOPoUCPmALGvnGz68S6IHty7djDmLXiOAk0OoQq8gibIhVmm6
         cjFmBc3T1nuy+cQLMuBJ8ZUtDyPQsLYipbADT5lx2HbPGvFAHaJHCqsKcHDupaXp0/63
         XXzyOOpLfONuNga0+zCuuC4rwTxuTP4THHQGWhLrBNv1NaCmCu/ZkDxXKr/euPL58Zej
         /nP9fVD8wdXeqEPm9PcPfwUDthUT6XzjOxd8f3r8CA1LEJdhw9KfSW82jGB64i6yXc0X
         Vdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYebvLPMU4hBXOXp944000DHj7RiZPclYhzhh48nuVM=;
        b=ALhLecqRdxCyUyGVD/e2thbg4aP4Cvgh5nOLJVhcmQEZUB83bmHjfpnCJQ3alWmPZ5
         Ai0ZsbNYbA+46wb/9/DoNT8i4wroeiya5jb/pXLfNEPXDbTicISodzEgaHTjgr0H48+F
         W6MNT7lZbkZHYHXNoY7PgXoZVQKKKKTfyrLbEVSKv3+5DOafM5bt3sVaHfmcZ0kk6RUn
         BphV4bPXLOveQTIO8eJAYdKMWVcghE0hXoENnHaWJt6NreZHRgf2woQrjofz/K5yBF65
         oRGp5dTL2GFCmTdMQb76V0OhtmV8roVSC1xcPCDxmRCrY52ysGM9FF3y/uyfCrv7jprm
         rDkA==
X-Gm-Message-State: AO0yUKUqy7ZoOdG2VyqnaH139dpxuNWtbJEIIcQ2pTcIW3kZujSXquJm
	8Us96qRNYGKZa1D30btNoZtW5hWcZbLm+LdS
X-Google-Smtp-Source: AK7set9ewb256R3moWGdiMYU8uZGeG9Jh3k0mOfpCe6B6dvWum5VhH3/Hs/pgdI/+LqVuTUAPBDyOg==
X-Received: by 2002:ac8:598f:0:b0:3bd:48:7097 with SMTP id e15-20020ac8598f000000b003bd00487097mr13310534qte.49.1676608277448;
        Thu, 16 Feb 2023 20:31:17 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id b20-20020ac844d4000000b003b84b92052asm2547992qto.57.2023.02.16.20.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:16 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] Add UEFI capsule generation support
Date: Thu, 16 Feb 2023 23:30:51 -0500
Message-Id: <167660825901.685488.13219659945357401492.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
References: <20230127192122.19338-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4414

On Fri, 27 Jan 2023 19:21:19 +0000, gowtham.sureshkumar@arm.com wrote:
> The following patches adds a class for UEFI capsule generation,
> a recipe for installing edk2 base tools in the sysroot and
> configures the corstone1000 recipe to build a UEFI capsule.
> 
> 
> Gowtham Suresh Kumar (3):
>   arm/edk2-basetools: Add edk2 base tool native recipe
>   arm-bsp/uefi_capsule: Add UEFI capsule generation class
>   arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000
>     platform
> 
> [...]

Applied, thanks!

[1/3] arm/edk2-basetools: Add edk2 base tool native recipe
      commit: 5914ae11f47fe85541b7c2f796a4b18ac7b49227
[2/3] arm-bsp/uefi_capsule: Add UEFI capsule generation class
      commit: f0945f499c49a10f15f05b0da6efbf01659ca03c
[3/3] arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000 platform
      commit: 3af64cee5bf963359e1aa304e55ff673b07f0294

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

