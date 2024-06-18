Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABF7C27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 17:56:27 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.971.1718733385886679904
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 10:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ktGbhmlo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6b50018e054so2105576d6.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1718733385; x=1719338185; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtnaTxm1u29FOPlV0Q6y8673pMKKMUXbwmIwRTypHHg=;
        b=ktGbhmlorIlYCLwSl7iZw6wb1Fvtbw8LOGkxSfjSqu6wn/GHDLNSkYzvYsVniL7gkj
         /3gM4UsqJP5USQM5LB3VK5Jkt/123s4Yi8LYRX7H0iPBMLR5Cmfx3ZpZPsruw51zvaqc
         d/sst/te7M4fLA//eG3zm+FTpCV8VMVMHm1AAlS8NTyzBrvAjDI0x5Zp1zDEZsa7z1lb
         UI1fF01EDjf8+NzET1qLBS6Qq2JrtrjSEYnT6r65E/buVxrZdIhG2dd5Yo9o+U0ORJ4t
         +Ng1sSeWHNee00YWUlTEpAQ8QsIaTtyLuDyAtpn/X/OhCzyrU9Q8RYtRcsEPPmdMZCcZ
         bFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718733385; x=1719338185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtnaTxm1u29FOPlV0Q6y8673pMKKMUXbwmIwRTypHHg=;
        b=eLKKLa01KxbTnAWkpF5YwVdDiH7lU1OG2Lma4QkqrZTQP0ufL0vwrG+dqfALshh6tJ
         hYYNBIRzh7/1Zbgfd5/omJZ60Hlfj2qJ3jI4eHwCmaJ10cWLkUBS2W0gxidKYZmWLwJP
         bn8RvR/1vJtZCV/rD31Su1zJFhCG2K4jAGWzMzGCKCIU+sexCKbGceHw/UFjUoNbcP6C
         6egvD4l7snlHWBh601t2zJW6MW33kb0dx+nr037IcNK7WWatJ3IL40X78w2ez5N1p7ll
         Gea+aSNB7y0ai1rBvDA46h5J53cAAgPeiO6S3jMYk5CIPUUguMFHFF69YTicmpf/eGCd
         BxEQ==
X-Gm-Message-State: AOJu0Yy/mPDCGX9ul1NTdjjGoUnV1ETLNkIKbpLTQQAUrxyUsNaZC97J
	KA9FnelusQHSz52Gk1ZgJhfrUEEhJ71V/Jf9v2dDw99HShoylCpzZfQeBYMNSkXJZuoDqd1ctyQ
	=
X-Google-Smtp-Source: AGHT+IE8RpCWn6Crfu9iX0mv6S3ilcLj/1Gxq1+fwTWRAoqMCGgJI7yLFSl3i/tL3T0uFBxICc4jFw==
X-Received: by 2002:a0c:cd13:0:b0:6b2:9819:754b with SMTP id 6a1803df08f44-6b501df8cd5mr6078276d6.10.1718733384609;
        Tue, 18 Jun 2024 10:56:24 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5ef4396sm69009856d6.122.2024.06.18.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 10:56:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon.Mason@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: Bence Balogh <bence.balogh@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>,
	Delane Brandy <delane.brandy@arm.com>
Subject: Re: [PATCH scarthgap 1/3] arm-bsp/documentation: corstone1000: update the boot chain
Date: Tue, 18 Jun 2024 13:56:07 -0400
Message-Id: <171873337063.2601380.10100402504956223032.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240613162041.346761-1-abdellatif.elkhlifi@arm.com>
References: <20240613162041.346761-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 17:56:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5828


On Thu, 13 Jun 2024 17:20:39 +0100, abdellatif.elkhlifi@arm.com wrote:
> The Secure Boot chain section is updated in the architecture document
> to reflect the TF-M BL1 design.
> 
> 

Applied, thanks!

[1/3] arm-bsp/documentation: corstone1000: update the boot chain
      commit: 841b88fdc2a380905bad16b054117ecbc015df6c
[2/3] arm-bsp/documentation: corstone1000: improve tests documentation
      commit: 71d36251eb511612f059f54a299e35c756b9e411
[3/3] kas: update the layers SHAs
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

