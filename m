Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05AFC46CD2
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 02:06:41 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.6834.1706148393648487697
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 Jan 2024 18:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=X4zE3pmy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42a4516ec46so2634901cf.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 Jan 2024 18:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1706148392; x=1706753192; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcMGgD0EAZm4IX/P2N1zAXXWKRak8T+lBhc63sxSTgw=;
        b=X4zE3pmyIfFeSFweFkgY2/SoDW8iQ9XLogARgt8w44KqLOl3LIeiWdDbFzYwgjalO4
         nuaish1n7P4493BEdobA+3QkE7gSXWkIYrDv0o6c5Pp4UTPxMCG3cSPCRORavOnYnc0S
         QAS9tVxzSern3k14TI0RWgZYBidD4EaEqa35wuUPuod/jch8gt+3V82D0FDL/JIvYX5T
         vMzFdSH88TRgkyTt6dqOyvQQgPOtTEdwbx8bZCD/mGUu0s1g9m3MTvXya51UB2k67Mop
         rHX0vyqLB7dg25aKQZqjmxBkpX8tuvBhgyA13OI3+LBZYY8Ad0jqbeUisnnOOj7Nr9EL
         5gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706148392; x=1706753192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcMGgD0EAZm4IX/P2N1zAXXWKRak8T+lBhc63sxSTgw=;
        b=Fj1bbxSYP6xuOHtqPBy8JfpiRM843n2S9TKwT/dOL05L+booJIFOgaZCyfzwQJVRgY
         ETzdeqhfBFRj7gBpS7+FO4G2RfDucifiL24JoerHGUaMuEO7tQpLwY4+4nvpQuUIdazA
         R2p3XWTg8hCq0cyv8PI6iEzIaJmIQVflP1KzQUsBGJWZ38eAy/hDXuvBy+BokyyWrCDZ
         1c4J6jQj1G4/I21szBIRGMeq1KJHnRlCRuWfxzDdfScrqmcO+yVyCrSDYjAJ+KlNe7O9
         GaBl8LWOuRJpSfpO69Px5CXWa7XKorrq7/sX5IUyGtnk7AcPGoMpXNVDV5Rbr+qV/yQe
         /bNQ==
X-Gm-Message-State: AOJu0Ywpa7GV6gix7eqCRdytmge4aEea6dXZAl6gUVSJ7SwZK/C8X1Hc
	uChPfoUQgLnvGOYuxQgyfwvLIdCNkdsMsTf5pDAxEWX4ImmCygBAEWuncJ2RHxq2p4YIkVvi0Qg
	=
X-Google-Smtp-Source: AGHT+IGm4yNJAJDHhE2ACsAa4aoJcqzaQyKo5FhuxVKTcd4wA2eSXGN+ZF56Vs3/F1FXQyYMjh3rOw==
X-Received: by 2002:a05:622a:1713:b0:42a:4e74:a657 with SMTP id h19-20020a05622a171300b0042a4e74a657mr913243qtk.48.1706148391812;
        Wed, 24 Jan 2024 18:06:31 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id t24-20020ac85318000000b0042a0a3d29a2sm4939631qtn.49.2024.01.24.18.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 18:06:31 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	harsimransingh.tungal@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] n1sdp:arm-bsp/optee: Update optee to v4.0
Date: Wed, 24 Jan 2024 21:05:22 -0500
Message-Id: <170614832369.1641727.1306756351719382574.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124145734.1694665-1-harsimransingh.tungal@arm.com>
References: <20240124145734.1694665-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 Jan 2024 02:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5358


On Wed, 24 Jan 2024 14:57:33 +0000, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This change updates the optee version to v4.0
> 
> Harsimran Singh Tungal (1):
>   n1sdp:arm-bsp/optee: Update optee to v4.0
> 
> [...]

Applied, thanks!

[1/1] n1sdp:arm-bsp/optee: Update optee to v4.0
      commit: 6bb1fc8d8c815768effe7a19094ecb7e6c1258cb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

