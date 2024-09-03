Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D62CD3442
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 15:32:41 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.26443.1725377559230742154
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 08:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=EjGqPMj4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bf92f96f83so26572776d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1725377558; x=1725982358; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaVcPzTHAVGZxWW1jxp/QW0gJn1qNkinXJpxZRqakv4=;
        b=EjGqPMj4LNRTDn6ivfutMcqz03pQggvgaCqTsePY2j4fBL2H/yksip9l5oood6zgyC
         +PI/qohev8sB33EvWc66TQ9BHUls2V/XOv47dQ56NxfGp87ap7+1C7bk1T5yKqZVq6hR
         IIkK2isJup2/9UqzKp8Uzt81GoUR1C9BLFRNUBW8t19D4SbpoLZtglSpg0w3lIESXQo0
         3Q0rHlTxVMOGFPBY02ZyphKXuppBk5BVOsYOq8Gmo6TjHnda+tM0ORTVr/qD6qi/Q6pO
         SwcR7DacmMadJph5xLirnxA5E+Y58BVm0A3UyLqVZ1aEyihZDCIJLUm3G1+Mr7XY7eij
         ncrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725377558; x=1725982358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaVcPzTHAVGZxWW1jxp/QW0gJn1qNkinXJpxZRqakv4=;
        b=WBeIr4ZIDJq04CHPE9EQS3DFuXQHSEQRweVm5/+BpTvRMZ43d8r7oCaNMbJC1CxHaP
         xq0dOfnecwcSvabDKWscqxD8+g0y4nlC3rLcSzC1qxJLLiY1qKHagDEd3X6xG2LdTI/1
         nomvLyR+1F/bftcvHdvwnTMV00zF8RPR09aTkItPtXlJf7SdnGyWY1+ZaF1+Nc1/muuh
         so+msetnoPT6n4pxyomNFOGi9PghMnevQBNhZmvUV4unFCaQFHfXOamMN9ko3ybVxJA8
         uLfjjzmLkdYhrJajxawZkJvOzxKFfHQwRWwPOdVHgR0PVjXR2FW2aScjqzAqbnOxXfic
         7n/w==
X-Gm-Message-State: AOJu0YzyutXOywRZ4seg/AH1Tll0rO8x9wTjc8uW8xtay6/yyXFLoRpk
	6zXcxTMf8iZe/+z+Q88nNY32LbV74xk1OU+gtGlM3moNSUsE6QjYAV8IMSqTiVdhADkinj7R5AQ
	=
X-Google-Smtp-Source: AGHT+IFq35t8oBOE27a5k+RxzmnsGW6aGm2xI4T1CleffW8aCwQDY/y5q4CKb3xh4CEeGUXu14mf/A==
X-Received: by 2002:a05:6214:4697:b0:6c3:4823:22df with SMTP id 6a1803df08f44-6c3553ed971mr142550516d6.21.1725377557975;
        Tue, 03 Sep 2024 08:32:37 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340bfa7d7sm54899966d6.4.2024.09.03.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 08:32:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/1] arm-bsp,documentation: corstone1000: update user documentation
Date: Tue,  3 Sep 2024 11:32:22 -0400
Message-Id: <172537754408.2698594.6950082403956003014.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903095602.167973-1-harsimransingh.tungal@arm.com>
References: <20240903095602.167973-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 Sep 2024 15:32:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6053


On Tue, 03 Sep 2024 10:56:01 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> Add new usage details for running the secure boot testing
> script located in the systemready-patch repository.
> This script is used to create UEFI authenticated variables and sign the
> Linux kernel image for the MPS3-FPGA and FVP secure boot tests.
> Reflect the latest modifications to the script usage in the Corstone-1000 user guide.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp,documentation: corstone1000: update user documentation
      commit: 9d00aa03f6d1f88eca229fcb2677eccfbcaf392a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

