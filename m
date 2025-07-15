Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7643C83F1A
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 02:31:50 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.5444.1752546707799445415
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 19:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eKUr1fxZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ab3fb340e7so61743451cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 14 Jul 2025 19:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1752546707; x=1753151507; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuAae5rmIjryaeALYUAXrADH0kBe3fhfAwFEvVV6n8Y=;
        b=eKUr1fxZtUTxQ/icLyw4ae3cd4y1sOMWp17h8ihv2X2A6vAM5SToK1KsoY/b12HUwY
         N6y2vn8MF7Qo02dsZeXRklZwN6EcOfh+ZXRpvQip1AhN6Yi1wWoH2fUQqm5jKmO36QBH
         odxIqtCTWDtkJeJglB8agY6J3w0omkTRXkdUC6neTC69uSKX7dyN0MMEXv3RUfJEz8nB
         fKCI66UNYcVZQmLfDsBwSpE0Qd1Wir0iVZOFzH3So2BOJ3e+WGxcpr8bXmE9iGtE4OKt
         HjoOfokP0YZ4DeFEgwUd6aI7Yp2y60PXjq19NounliUNXqn+N/sa0d54aDvAIymIgt5f
         lNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752546707; x=1753151507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuAae5rmIjryaeALYUAXrADH0kBe3fhfAwFEvVV6n8Y=;
        b=fJmoEiQOJjH13KXtb1i1OxTPMJmYQ4TlC4qjyJeZSZydtk2g/KotJm/kGUV3CU0AHt
         n+gO9asjiigNlnqaj1kpAi65M5nV/P9RtxUb9DeloFM7H/Dc3KTlt2wohkZsvQkf/UnD
         vIgJXjrnkELlcmcI7lMMeviXJG1qo7xmQu1DLuDIuiYk3Inr6qHicrrDvvE5yViSFJCK
         x6jInNLU23bgT7R9055fJ3tVh75l9yBXnTFFD75gHJJYFRYRRC8fn4xJ/wzcxQOB28VT
         Ys9Kx7iA3mi/j+juNmlP97RWr8WmM0nzpXzMCQAYMBc0n8eN0+78ilU68vcvONq/WqbZ
         7NLA==
X-Gm-Message-State: AOJu0Yzz1rg+RQ6xfpc45sCozd8+QKG52BUpp00uxpdUg00ItZO9CR3F
	34oBJZpT487iJwCAM0KHkbQX2Fdx87Fe/YGOix+tRA2wG20xQUlkoN86mZf2qvsP0AaDqGrp1q0
	beCM=
X-Gm-Gg: ASbGncsSmryziv8pIJjtiQgvFKpXeuZHqEI+IW+YwkfvyEtomgb4K8lMNZC99nBtK1z
	M75TzJbpSqjcpRHP3pFCZHlu+xlkl+alvQOV5Hh2uTKwBFWbLbp8eiP/W9kDCA22W7RHNYLpqTn
	VwrapWUElTScMR8NU4zFocz/JopqFNukV8Aes12hrTp5GrAFcc7SE+sr5gS1C1Gvi7pb6AbDqnO
	IM9himGGwi+0B+Yil/VPF/4MhZdSqxj315RBqdV3H3xvfqffmGiDQhznxeqm7mqHbOsD/NLstbW
	XygDYVhWy5WefL5fX97r2o5AOvk/qtExVo7nIWmy+dnVvci8DerPjTXvcGe8GYB/KY1dPqNrg3O
	ee0aNeD2D9Cmtmg==
X-Google-Smtp-Source: AGHT+IEnqywX/0wtx8SDRv0HP7C76L+Yn8uyIDCWumNM4X9dtq0r2jkOIlFgmgOkAQaIbxdSkCbHzQ==
X-Received: by 2002:a05:622a:1996:b0:4a7:1402:cce9 with SMTP id d75a77b69052e-4a9fb8613a6mr226737201cf.7.1752546706528;
        Mon, 14 Jul 2025 19:31:46 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab3a1ceae0sm39381741cf.25.2025.07.14.19.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 19:31:46 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/arch-armv*: Add basic tunes for newly added ARM ISAs
Date: Mon, 14 Jul 2025 22:31:29 -0400
Message-Id: <175254668976.2095653.17861013136103412543.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250714135740.56280-1-jon.mason@arm.com>
References: <20250714135740.56280-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 15 Jul 2025 02:31:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6611


On Mon, 14 Jul 2025 09:57:40 -0400, Jon Mason wrote:
> Add some basic tunes for the newly added Arm architectures in GCC.
> These will need to be further fleshed out before submitting this to OE
> Core, but should be sufficient to use for machines that need them in the
> interim.
> 
> 

Applied, thanks!

[1/1] arm/arch-armv*: Add basic tunes for newly added ARM ISAs
      commit: ad4cefeb514f3bddf7f4f415cf9a32845868904a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

