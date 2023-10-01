Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF69E78491
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 20:19:16 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.67583.1696191556583148339
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Oct 2023 13:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ag3cxvqN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.169, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3af609b9264so3146743b6e.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 13:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1696191555; x=1696796355; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+s3/RL47tmbIFKBQg+K6ED/FUEtDRS3o9lbL5HZCL8Y=;
        b=ag3cxvqNS+P9n3OQVrPttfKSftsJng8cBfJ74M94RUzvEUvs/MDxSv47NQyRD2bF3d
         JPLSAuJJY0wSyBk6+spmpziYAFzrBHgudbTsalFqhhIiXamdh814gcRtyw0WZefM8yYM
         vd5x3ua3ExUN9dxGw7VuZ8iXUS+QAEbvF/er/yB/qX21FN/KtgDq/F4zIUvAVzZ0home
         FHyc7fZWarprZbMFM4zUEcSpoIqiQ2IgXfnRwI7m2xlgGiv7u5MN0XzSY5EHsBKD6ui9
         Xatjq/lC0l94P4Dd4o9nGkL1tUo2T4r0xfYblVvshFzeGr5O8ZSxKzenZmRRjVDNymIZ
         IUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696191555; x=1696796355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+s3/RL47tmbIFKBQg+K6ED/FUEtDRS3o9lbL5HZCL8Y=;
        b=EmuMB4ZLuKPxvnYRLaO9MIy/twBYGv0UsoPCHq/02/d2si31T6hvLXNXDXObhtP3dX
         aL6AK8xX5CnsBUQ9TeoHsVEJIOEwtDWhMPu5b6LJTAVCO9qBFGKZMdI4+7C5gOUzgXNJ
         TqsD1j7aq72ytm18D0tE+vZel7EGCIpyC0y0qM7VvcnI+8+2bbbzGmyGEt7Cwhk+jpCQ
         SnOIL4ZwIfZmIonSLRqwFrBbwEMdqmlgoa0jZz5zHn/b5U5JVKHbftrfFLvnBOkHxbdm
         IhWqzrXVXu/kT7o0FMz9doN4q2dCCRe8gJge4nhnBS2rrk7TxpSOteGDyCUgiFKsZ3nu
         v0ag==
X-Gm-Message-State: AOJu0YxIN7xHSMK+8XgiOoylj40fAQvIyhWRsJ0Hq5lGIi1mDOpg1dj3
	suvwyLWrfakHYl4oGeG10PVGM8Ugp/rdM7ZRwt8=
X-Google-Smtp-Source: AGHT+IFaJZT3SiDFvow/KBYzQy/0imnL5mzk38PSMytB3POtctuGSrrVqHqvudckyKTEn/0GqcXjPA==
X-Received: by 2002:aca:1a11:0:b0:3ae:156f:d31e with SMTP id a17-20020aca1a11000000b003ae156fd31emr9150649oia.1.1696191555285;
        Sun, 01 Oct 2023 13:19:15 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id j3-20020a05620a146300b007676f3859fasm4820916qkl.30.2023.10.01.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:19:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 01/10] arm/apply_local_src_patches: allow use in multiple directories
Date: Sun,  1 Oct 2023 16:15:22 -0400
Message-Id: <169619132219.3169419.14023585507851002171.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230929152128.3401009-1-ross.burton@arm.com>
References: <20230929152128.3401009-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 20:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5095


On Fri, 29 Sep 2023 16:21:19 +0100, ross.burton@arm.com wrote:
> Pull out the patch application logic so the postfunc by default scans
> for patches in LOCAL_SRC_PATCHES_INPUT_DIR and applies them to
> LOCAL_SRC_PATCHES_DEST_DIR as before.
> 
> This allows recipes to inherit the class and directly call
> apply_local_src_patches as needed to process patches in multiple
> directories.
> 
> [...]

Applied, thanks!

[01/10] arm/apply_local_src_patches: allow use in multiple directories
        commit: be76055bdccaa476f6b68abf1ff26c007d4717c9
[02/10] arm/trusted-services: pass through CMake generator
        commit: 893b20fbee25b7a9a6791ec415fe6117ddeb2cd8
[03/10] arm/trusted-services: add missing pkgconfig inherit
        commit: 7a126f00ded5a4cf013df80e75198c1f55883eca
[04/10] arm/trusted-services/ts-remote-test: move binary to $bindir
        commit: 909d49fa6f5eaf3ee686b5f6c0eee5ed4a830d47
[05/10] arm/trusted-services/ts-sp-env-test: add missing DEPENDS
        commit: 549e05e486cb55697adf2fd068e6cc22dd194942
[06/10] arm/trusted-services/ts-sp-env-test: remove
        commit: 67deb2cf1bbfd343cc2bb847bd625a5e3b79ed74
[07/10] arm/trusted-services: use apply_local_src_patches
        commit: 46e6f42e31a239aee59255022742819ea1ed6aaf
[08/10] arm/trusted-services: upgrade nanopb and fix build races
        commit: 210a6ace832534cb1a492649e3e61532e9ca6a8f
[09/10] CI: use a venv for sphinx
        commit: dbad5d928199e3feae0acb43cc23c6daeacc7f1b
[10/10] CI: upgrade to Kas 4 container
        commit: 4d76ed4c75dbfef8bb444777dab9fae88e3dcaaa

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

