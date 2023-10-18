Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049EECDB474
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 00:46:03 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.272028.1697589955174106290
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 17:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=HEhyyQqB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4197310af61so42602181cf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 17:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697589954; x=1698194754; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoMVthFImNPfeexrlbqPvrAxC72jV5Ap14ixNWzxotY=;
        b=HEhyyQqBFTcLv1Z96Ns6704CrHSKcf5cs6JnsZnqhlJYbrzuwPIYLlxIUjhmYdylEJ
         qHQjtHF37SBXOrgxfCWIZPU/dVvePh5SglYX5r+QXMhaBwy0bl1pp9qisxKuMUKcvpW7
         LtQzehy9eqg+FKEb/kpq9IQ7FWrgS5/1K1hVz15PUyTIQox4eXCQmFsPRgs+4DUircon
         WVcfL2oQOs+GacqoEneHFrMWVBxMHq905P1OKm0zqZ8Z+Mp/H6DK3mQd1Z8kZ3bfQtfF
         MD80MzRF7HDYLI17glnpsP97YvUoneH5RoZ1RyKvvFf5FHbCUqX31FmqEzTn5iJw8TOe
         AImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697589954; x=1698194754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoMVthFImNPfeexrlbqPvrAxC72jV5Ap14ixNWzxotY=;
        b=WTWrSuUxPkLHvssP9OFQwMxlIVYiI+F/UcuvKJC6KLElngodfg3t9q4qPkwmUC5oBL
         XYzn9HDUvDobg905m69hDSVN7aqp/48Fg84QfOedXBPMMO8WUxt0dKAa+PtXAVTQKVWl
         I9zkF8vaRaCkncaaUFYsLw/0+hhfF1dqpLDnbs3PwwJ7jWmcSDKskfk1pbAEsDXmx3iH
         nB1Lm02DmATSncB9OxWXlZI+dz9CIPklI7y+SaCzYsaQAij/ujHI240EmAHO0/q5twgY
         LgpdWMfahvDv6sJPwMHIrdUOVTrcWKYbFeSpRTCGnwezSoHmh7p2CxuEJk5Su0NfLOMh
         Wz4g==
X-Gm-Message-State: AOJu0Ywqd+BVByK7DFohlQe+jUPDUg07vQEXL2nVfHlcGTilpeum9Oyn
	qCzAgRFAYjU4icsV2fY36aTFof/7/zUDpMhZ67c=
X-Google-Smtp-Source: AGHT+IHQ12qFTM2FB2LASA9Kc9+f//9sTGovfFPBj+YPv6ldtzOdcgO5J4ICo46K4UACL94Ufj/zog==
X-Received: by 2002:a05:622a:13ce:b0:418:15b9:8290 with SMTP id p14-20020a05622a13ce00b0041815b98290mr4378824qtk.53.1697589953776;
        Tue, 17 Oct 2023 17:45:53 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w24-20020ac87198000000b0041950c7f6d8sm1013392qto.60.2023.10.17.17.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 17:45:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: corstone1000: bump to v6.5%
Date: Tue, 17 Oct 2023 20:45:39 -0400
Message-Id: <169758994328.395951.4408436458211026649.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017165850.381242-1-abdellatif.elkhlifi@arm.com>
References: <20231017165850.381242-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 00:46:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5137


On Tue, 17 Oct 2023 17:58:50 +0100, abdellatif.elkhlifi@arm.com wrote:
> upgrade the kernel to v6.5%
> 
> 

Applied, thanks!

[1/1] arm-bsp/linux-yocto: corstone1000: bump to v6.5%
      commit: 2608ba344f10edad30ad2b43d0c5be4da0da5ea5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

