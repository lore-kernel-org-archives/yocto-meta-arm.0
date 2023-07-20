Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2204BC0015E
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 03:02:43 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.5066.1689822154653078963
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 20:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=2reDDaM3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-403a1d7d60fso3353961cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 20:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689822153; x=1692414153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RbgLkujgn4Da5tInlku8D6LYl1ON19xqgLnwxiy770=;
        b=2reDDaM3j+ehma57GkqMEn9s2SPAdfklfl8InNB0omp5iNrTui+SMrQNa3r1TlVKne
         Zz3JvikoMWUFGbhzGO71VrubN8tCDA9oR4/r7ABa2+MAXc3rOhmvigdgVan1kvZUFdZv
         3I4ZhGky4vhuqW0vr+1i913jnv6tn7OBg70z+C13sIgG1MjRIOJ96dE4tOkJxlj3I/KO
         qHL7Fw8u11krd97tuC+s0sEZoPo4Ipq/C4p8oO2CBnF8Jz5R39pof+NhbCsrvQgLJPIr
         pQpzj4NqycMLn9UVbb2lpI3YJaw6KJYrv4Wp9Pm4v0fUNe4GR4WOJHz26BnEnpQJNvS3
         202w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689822153; x=1692414153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RbgLkujgn4Da5tInlku8D6LYl1ON19xqgLnwxiy770=;
        b=KzmetMf66GepNqD9xS98XjfVOL3m9Z4MgeNqaCT0LMNhOoid3VqaSIdaHrbRp9+Mwe
         tyLDISnTXnusXdlcyw/D+lfCl84fcs4zm8n+VeptlYxXdE0i3N51xny2b6nVdbnoU6eM
         XUi/q2JOQSnIpLzCeFEin3NFHAIcXdRV2HyifPTxxGeMDpC8IkqoYS5s8RSchpI8AKGY
         VXGkIpDlMUDDYLlTEj9hlyoYqGJ2YHP4UJrUOLNc5UkqyBjqkjBxZatxFZDzwOcevJrC
         OCKpkhNJcXWa194rYVBZyi+hFanntZ6pFEhI6Uvqd/0pbz2mCTse7GfAT9n5/ZoZPVsq
         eGXw==
X-Gm-Message-State: ABy/qLbEUu5C6dsvPBZDAFug7ClPmW6ov+cujC9iPPTOO2hgv+GZoYmS
	sGwdsHT+TAbBE+HbT9imFdH3MoacaMdB2OXio9U=
X-Google-Smtp-Source: APBJJlHrS1cAnCYqacjjKHyifBAZXsa22CsOiRq8emP/dt3japluof1xYel0K008ripDLtjySJVmhw==
X-Received: by 2002:a05:622a:48b:b0:403:ac95:c6a9 with SMTP id p11-20020a05622a048b00b00403ac95c6a9mr1077791qtx.30.1689822153370;
        Wed, 19 Jul 2023 20:02:33 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w9-20020ac87189000000b00403eab8b7cesm31046qto.16.2023.07.19.20.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 20:02:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ziad.elhanafy@arm.com
Cc: nd@arm.com,
	Ziad Elhanafy <Ziad.Elhanafy@arm.com>
Subject: Re: [PATCH 1/3] arm: Set FVP EULA environment variable details message
Date: Wed, 19 Jul 2023 23:02:10 -0400
Message-Id: <168982212997.2718612.6963830266448649975.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
References: <20230719155449.3456824-1-ziad.elhanafy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 03:02:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4909


On Wed, 19 Jul 2023 16:54:47 +0100, ziad.elhanafy@arm.com wrote:
> Set the FVP EULA environment variable details message
> to request the user to accept the EULA in case it has
> not been accepted.
> 
> 

Applied, thanks!

[1/3] arm: Set FVP EULA environment variable details message
      commit: 4e3cb6cbe40515a30dece61bc95b25752ea95277
[2/3] kas: Add fvp-eula.yml and remove license related settings
      commit: 635989dbbb4146be1776d45e726a667384090e16
[3/3] arm-bsp/documentation: Replace FVP_BASE_R_ARM_EULA_ACCEPT with ARM_FVP_EULA_ACCEPT
      commit: f091a160b8a8e20047632b7c124cbea5e9fd5339

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

