Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70586C678D5
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 16:59:46 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.12825.1677949184580186861
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Mar 2023 08:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=5wlzGYLv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id l18so6316107qtp.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 08:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1677949183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAYHrstgd5kM+p18t54465yccFISQBP+2GQJdA46Uz8=;
        b=5wlzGYLvpSrIA1PQUMN/DtHiJWUsMeNKAGh6Q3GbWkpxZCHvvAUb7lantcNUI4P+Ur
         u7yeHFcmxahBPAbAvDOyOydnUq3AE+35mhKZKuiPOvgh2iWlhILlLwsK3lIKIgHH0Emm
         /mPAc54clhJFwN39omX3ecmw/cQMFW/1Glz2Z8oTn9FUCJWr4WiQs2d3cDzSA3pyEPxQ
         BlD6HF/C8x/llfyu2U798/SEE4BnoSmVWc2nnwljTTGeYx5NITcu6oaGWmQkDIFqo+eU
         agXzpBZa/H/XGJbi0JGTQFIgLhAfntM5+occxFRCdKbR50fNIuaOJvYACeV+zvjoGZRj
         4G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAYHrstgd5kM+p18t54465yccFISQBP+2GQJdA46Uz8=;
        b=IYkLiJipqoTgFx/qexJCS3H2KeBQ+ICcsPdPaPyQgC6X12cPbqK1l3ws9NFKgOZJVl
         hGpoD4ErJlWGozAeOjIgH5cJYXsVKG+AzftkVlGudl2OjT0SRIQPwX5IAW5+5IEQIeIk
         gsuLBdr0Hyhh9y6M9jBjEWJWJYcWUD0SwFKOb/bv7R93720ZXsPdRVbtk5h78eJuTxU/
         f7jjjXYpZXNkGIv8sl2wRDKk2qPXExVSr/NO5gFs5hv9th3eaKh3GUy4e7TWPqmji8c2
         slMm1nq06vvFWMlRQIAuZn2SrCzgt91oXzz+frShvMVVNSiFmVxt6yBlC/xTSY4rRBl9
         cgig==
X-Gm-Message-State: AO0yUKUulmGV7w1C3N3Q8c+hHxlYQcM3vZqi02OMeDRFvHrpIbK2fU5y
	9R7z0EH3NH68yRTEb6vg8GdE4dvXxnBHb15btOM=
X-Google-Smtp-Source: AK7set+ajwuoJXbS56+ljUIq3OHTEwi2rwJK3xTUygeEwYtNfuOrIZalrR3VsTu+5mVg3lM4Gktk/Q==
X-Received: by 2002:a05:622a:42:b0:3b9:a4cf:313f with SMTP id y2-20020a05622a004200b003b9a4cf313fmr9947795qtw.29.1677949183334;
        Sat, 04 Mar 2023 08:59:43 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x8-20020ac87008000000b003b868cdc689sm4107790qtm.5.2023.03.04.08.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 08:59:42 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"gowtham.sureshkumar@arm.com" <gowtham.sureshkumar@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/6] Add UEFI capsule generation support
Date: Sat,  4 Mar 2023 11:59:10 -0500
Message-Id: <167794915041.51440.1175528216953244025.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230228144152.17041-1-gowtham.sureshkumar@arm.com>
References: <20230228144152.17041-1-gowtham.sureshkumar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 16:59:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4472

On Tue, 28 Feb 2023 14:41:46 +0000, gowtham.sureshkumar@arm.com wrote:
> The following patches adds a class for UEFI capsule generation,
> a recipe for installing edk2 base tools in the sysroot and
> configures the corstone1000 recipe to build a UEFI capsule.
> 
> Gowtham Suresh Kumar (6):
>   arm/edk2-basetools: Add edk2 base tool native recipe
>   arm-bsp/uefi_capsule: Add UEFI capsule generation class
>   arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000
>     platform
>   arm/edk2-basetools: Convert edk2 basetools recipes to native only
>   arm-bsp/uefi_capsule: Use json file to pass capsule config
>   arm-bsp/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
> 
> [...]

Applied, thanks!

[1/6] arm/edk2-basetools: Add edk2 base tool native recipe
      commit: ccf216ce4d5e149d907ab2777b2b39d71b90bd53
[2/6] arm-bsp/uefi_capsule: Add UEFI capsule generation class
      commit: 7a1649137389bff0ad1a4825a2dc148290437a3b
[3/6] arm-bsp/corstone1000-image: Generate UEFI capsule for corstone1000 platform
      commit: 2792359e0a6d2663b0d8b523e2290b14029cc4fb
[4/6] arm/edk2-basetools: Convert edk2 basetools recipes to native only
      commit: 50c462da2d60145b5dc65cfb54fe9020c6859774
[5/6] arm-bsp/uefi_capsule: Use json file to pass capsule config
      commit: 71f92f4df8b8ea1a45bc8639fa2ced576d991ffc
[6/6] arm-bsp/uefi_capsule: Move UEFI capsule to IMGDEPLOYDIR
      commit: 04071ec9f5091ec76da202ce610e256d8d347a60

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

