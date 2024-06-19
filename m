Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A064FC2BA15
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:46:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.19898.1718801204664687592
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jun 2024 05:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=O3cnac6W;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.169, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-62ce53782f4so66464307b3.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718801204; x=1719406004; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWR78akiNmBuWD1OtU1RJgQVv7jAe66RapWKPd66efs=;
        b=O3cnac6WSs9YM7igkBH2XLyEyH2tl97SbkSaD9xsqcUFsH41RD4gLD9sk8PTu7utUC
         Wa7YNve5ohgnfLrZVTcvGcAZUlNcmyL+X1hGD6VO4D/SV3+QV8AMH0ekcHsDuZvm9nyd
         deUnvs6v+yyVeteW6SB1fDjrU5diFDSqkECmEFKQMGUC//X+QBG6OBObXQ2dM9tbb7Qo
         LQlFVV10Im9H2TyLfTwnWiIcwUrP68x+bPdkAAiWLJxVE8XqgVFxtNOrI6QnlaVli6Kb
         IbpxWjVLZ6k0XWb0S9VST7ZRFc/nvTPZOE844qrlBQpRnZzfHNrUzkFyD9ZzHeBHZDHR
         kh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718801204; x=1719406004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWR78akiNmBuWD1OtU1RJgQVv7jAe66RapWKPd66efs=;
        b=I/dGOsjuBUMBpLZdb2oFcs7lLaa6rFphtJrPSMHSVjTnc0rgjI0vx9nCatXjAds+fs
         6vN6n9DhZw2UzjTOFPM8/50FXc5ccnkQUPBIaoHD3EXm14AYmjPHL56DOcKHQJS0ukbm
         DF/TP9T2QQyGb7+Buu0A5IRD+XWIkw0DHS+eux04ww2Q5r4sathDjep2V0l57QwGV//T
         4/wdoBFkiMKC2R+zSO3E028mmQqiyyZWInmc2sT4TPenoEv+EmTIWI0mJFDdXaRH51dY
         zHReA1wloJhUS0MSnP7ErWsvwcuSZEmTXCcVrwmTtx5/AOdVGIvVxhtvCf6StBfDhCAn
         Vgtw==
X-Gm-Message-State: AOJu0YzQX0kj+NK0Q448lNXXYFhbJW4P2i4AU2pYTOsYm8PWDtKGuffm
	cW3zasclayncWhbvOyEz7skI1Byee+1LY5Dg1Vo1L1cOEutyKrzPTkKNOFlncdmL+7++DPJZFPk
	=
X-Google-Smtp-Source: AGHT+IHXn+t21Wz4uUlv4jswuywrjIZbvWw2zwOGjNLpNElyP36gJIMx+d4RkGzTSCUB9dOzQfP4DQ==
X-Received: by 2002:a81:c604:0:b0:622:f785:5499 with SMTP id 00721157ae682-63a8faf21b6mr25525637b3.37.1718801203680;
        Wed, 19 Jun 2024 05:46:43 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6311a4461absm20944647b3.92.2024.06.19.05.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:46:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH v2 0/5] arm-bsp: corstone1000: Enable multicore support for FVP
Date: Wed, 19 Jun 2024 08:46:30 -0400
Message-Id: <171880119304.2085664.4982379953165986797.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
References: <20240618152724.7273-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jun 2024 12:46:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5833


On Tue, 18 Jun 2024 16:27:19 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This changeset incorporates the multicore support for Corstone-1000 FVP.
> 
> Changelog:
> ===========
> 
> [...]

Applied, thanks!

[1/5] arm-bsp/optee: corstone1000: Remove MMCOMM buffer address
      commit: 3e13dfa18a78b7ccd14f9d75a633b46655423170
[2/5] arm-bsp/u-boot: corstone1000: Enable secondary cores for Corstone-1000 FVP
      commit: c42a7ffd3ec83f7b81c908a0540f2084c274d0eb
[3/5] arm-bsp/trusted-firmware-a: corstone1000: Multicore support for Corstone-1000 FVP
      commit: 3eaa5c632c40c5f1eaf1c5e8830c40313177a11c
[4/5] arm-bsp/trusted-firmware-m: corstone1000: Multicore support for Corstone-1000 FVP
      commit: e437bc8f7d853be5d69b57382d9c8b7b964dda1e
[5/5] ci,arm-bsp: corstone1000: New MACHINE_FEATURES for Corstone-1000 FVP multicore
      commit: bd9fc4bbfca00be91b1cedde986adb9582ea60a9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

