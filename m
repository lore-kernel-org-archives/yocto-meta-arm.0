Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9069CC5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 10:04:15 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.9010.1710410646612444964
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 03:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2ziwVCPU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-69107859bedso5175866d6.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 Mar 2024 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710410645; x=1711015445; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72Rs20SfSQXp/c0OOCQ9laDtpx2pfMnKx5tV00Un59M=;
        b=2ziwVCPUQxQjD4sz3mTbzsK8C8KIC1f/s26slyDYj1ZT6bPm6soynBk99BUUiCI4KW
         Owc3pk3Zm8xO0XgZHkoDENyO1Hz9DAbD88vewloJdzRStzq+6hwU7Z+W21uGXSpUG7xK
         iaKCntAMEqxJi+CfBdASCaiSVx1ytphQisvF+eb8Pjq8LwHTR3MLrL8F46FQ7aWgKsYb
         P0CH4rAFed26/VGgPz/6NGVt5wm3p/zHRZReKSyIr2DUgX5CgIOwBOcQfps09BXSpIWw
         WGsmEoFt5xe+AxuZE3ww3OZNahK1q2w9V+qOyIDwLJmtYVegcHCCuSEXPPVgjK0Fe76y
         L0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410645; x=1711015445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72Rs20SfSQXp/c0OOCQ9laDtpx2pfMnKx5tV00Un59M=;
        b=TN8se9pcjG3bh4xqUoCzmNvg6YA0SCgLjx9VxXU/clqmjNuvcrNft0tqWwz1nD1Gq6
         cZG+F3FANKyuI1JeFddbQV7Gsjuh+0+pb/aJLpSIuENNYbHuaA7/jks98qB1jun8w2xT
         sjC1nIfd8NJNZZCpy3JVvCSHDPR5csS8/HlSdu0fXbKgS9IWLcB6D/BhCbox7sXOyhG7
         eosWYCahlz0fnMQILp73ZDcgZ86pZNF8z6/o5EpADNitovb+IqbT3fvZT0cKwYuEjyAd
         hLaTs298qsDkX4Wi3FKWeJPIHZBaRbvwV6RMKnVgK5pEnvhpRZMwfjNPlU38K6ZS5zVV
         WEUA==
X-Gm-Message-State: AOJu0YwS/phopgLt9YHf/vtyEvgj01vxMHt1jFYPGmcvCmqyTQ7ljAXa
	uityxq9SiQZhmwNJH96zEFM7oa6WrKLZSi9v/CRm6a3ylZMHRT2eS/53EPiyV6wIsL5qFK3f52S
	7Ow==
X-Google-Smtp-Source: AGHT+IGn1SufdA+t3VpauUckqcoZ9fC9hozGKDHxrfYZlwpMrXSxm2nSL1PbpnEZpeR7DrDNYnDuSQ==
X-Received: by 2002:a05:6214:1650:b0:690:d295:a2f9 with SMTP id f16-20020a056214165000b00690d295a2f9mr1262096qvw.2.1710410645460;
        Thu, 14 Mar 2024 03:04:05 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q14-20020a05621419ee00b00690edd77658sm213517qvc.75.2024.03.14.03.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 03:04:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] README: Add information about release process and mailing list
Date: Thu, 14 Mar 2024 06:03:29 -0400
Message-Id: <171041061036.3271300.1767862267428094572.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313182112.17829-1-jon.mason@arm.com>
References: <20240313182112.17829-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:04:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5437


On Wed, 13 Mar 2024 14:21:11 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/2] README: Add information about release process and mailing list
      commit: 2bfbb33518f7f9716a52d363460b233f4b2dc97c
[2/2] arm/linux-yocto: remove unreferenced patch
      commit: 74ac722826d020341ffffdf255cfcdd302f22410

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

