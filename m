Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1635EC678D4
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:06:17 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.95519.1673633169093188414
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=F+MHtjjI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4d0f843c417so182017597b3.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7b0YeyrEKc4xKzgiVlSgQ4Dc1zxrJWUSC5Sgi3RUNKk=;
        b=F+MHtjjIMw606E7wrOuk7Q3xG84ujAaNR9Sg8Low/eVBEl5T73l80ikkpfcaC73ccW
         VtNS9xbn8mu6fp6TruIoEVcisMiKsgN3mgnCZ1ekAGD1ZoB88C12O586PobwUBcHIOQB
         QuzloN8hlDAlcZlKHaFiAX91BWQQ8euJ+WpY+SC6aNTthAea7STxmbzr/1eftF0+D3ge
         pq8wr+xyGrXSdq2htEbUbLGLe0c4lf6AMOqRl8uIYTiwanUPA+ulizvpB2SldeoIYm2R
         gmAFxNmAesNnHRKZK88Z6agmEK3ioKGUXRryrMSbSUEasD9fvtGHUG9pGmYzsu37Zf7P
         P6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b0YeyrEKc4xKzgiVlSgQ4Dc1zxrJWUSC5Sgi3RUNKk=;
        b=hTQPZzmNjU+KAlS9fk3LGrdKER8JjEWv0/AtcK6/rguWHIyTHdU0Ko9LdNqP1wTBNV
         jypg2HM2xftIxWCUnKPQpUdbG6Zvs6BeAv80XSD0uwmCp1Eak/o6TPGn1aua6JswxARs
         XjUXURdk5CcUf1SmvDIdB0i3qF6umpItmoP+VBAhIe4rw07Wd61GJ1ZRFUggleTjoqeV
         onsRCfxWIT57xAA33BiIW6ruUP7Dt40bqDpKQ8X8L5XQMsftzgMntTrV62phbP4G/nJ0
         0OyOryZVcQ7gKbSAbu/39ylfACsbwwTjEQTRz1bF+CskRv4zeI0eRweIzNttIZclogaO
         BoiQ==
X-Gm-Message-State: AFqh2kpkcEL0vX8oQaP9S+ZIvkDyyRn3CtX4rDhDbJ4ZFRHHb770NhKt
	DlMUqjZvn6yuWqq23Wa+YcVO8bPiRD9+eoFk
X-Google-Smtp-Source: AMrXdXvvGc94EP4QnzxRdXbgL6Xj8UgTAgQUtBV4RaLa/476Xx1/jlIQ9LmL1HTS19WUeolqHy0K3g==
X-Received: by 2002:a81:17cc:0:b0:36a:c8c:aae5 with SMTP id 195-20020a8117cc000000b0036a0c8caae5mr24743847ywx.52.1673633167904;
        Fri, 13 Jan 2023 10:06:07 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id y2-20020a05620a44c200b006f87d28ea3asm12978470qkp.54.2023.01.13.10.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:06:07 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH] arm-bsp/u-boot: corstone500: bump to 2022.10
Date: Fri, 13 Jan 2023 13:05:48 -0500
Message-Id: <167363314944.1009004.10846543108353848168.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128121841.3949151-1-rui.silva@linaro.org>
References: <20221128121841.3949151-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:06:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4287

On Mon, 28 Nov 2022 12:18:41 +0000, Rui Miguel Silva wrote:
> Rebase corstone500 u-boot patches to 2022.10 version.

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone500: bump to 2022.10
      commit: 3f35573acbdc0a3aac9e81d794e14f849d40ee9e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

