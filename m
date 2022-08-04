Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEF5C19F2B
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 13:07:55 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.4464.1659618467773909844
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=5EhOilL/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id h8so14019997qvs.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=C46iRgMMSELBybnq/pAyM0VQ7UdhQzRVAURZDXIAyxs=;
        b=5EhOilL/hGUMnPm8z9v8Vap2QlFx9tfqj+AlTsp06Z14MY2m/iyxjYPz4iRdkOqdJH
         CCrE7fcJJ1S2RuUB8mK4eCeokp+CB6Ad8Xk0hAN3E3XRWTNaTxJ+I/HYfapvl5ERYD+4
         WoXVKwDs6LLu7AON3jtDKQe3bIcnuDq1F+vJ/ilcsibdqRVPtaGGiemIHIQouBFfBg6R
         KyFc7c+oZsBl8Adan1Hi6r4UclYkgNYossp7PU7CKGr90eCMIPF8G2Te2hNkaz1PNKsX
         /N2Bec05AvOIJmMtdCqPb7yBEhmBVx12mF43p+FT75CczCihU+LPrEqbEu0x4J+mHaXt
         yTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=C46iRgMMSELBybnq/pAyM0VQ7UdhQzRVAURZDXIAyxs=;
        b=monJ9zSVFDt4zfMxTYAlBCokBQDntq0ke+5maH3g7fuItsXR0aJDFV9WGdmsPAAnRp
         nIr0cGp8g62ACxjM4WE5p7Np0l3Ml+7S0kFAuz4eNmrzGnzaLMtKmRkkHgDBNEbaHIn0
         vbfRY2DesfG1uSLt79eiOBEisLdnZcNNWIet01nVx2UoPBNtpdwB5gl9O9HxE+rODp6z
         wQnbbNMz+l9DLsvjyw7Y3hNmyzclIiZOIXbB6tkgEeiH/y1StHUwDqNbRWjQFPyGk6XZ
         xvBeKdYrtEExFgJiywDWrCTUCBHNB8JTNCR1utypZDmPKArzM2bueb2xX+0gkfLl69Qu
         G9Zg==
X-Gm-Message-State: ACgBeo0XQIK7ribisS8uUee06K87wpgzFVwpkpH2rq9DReDizr2FXde+
	HpsgIyddU2Wv3uGj2kZJ2SaeY7JNOKYDfw==
X-Google-Smtp-Source: 
 AA6agR7kEXPJaAncXejViAjzbHK/v8Fv8aaurauZfFxuHe7LY9/WB3LJRV1BKVetofWRoz9y4wuhsw==
X-Received: by 2002:a05:6214:27c6:b0:476:779d:f691 with SMTP id
 ge6-20020a05621427c600b00476779df691mr1227790qvb.63.1659618466392;
        Thu, 04 Aug 2022 06:07:46 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 s65-20020a372c44000000b006b5cc25535fsm603942qkh.99.2022.08.04.06.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:07:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Robbie.Cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>,
	Diego.Sueiro@arm.com
Subject: Re: [PATCH] runfvp: Stop the FVP when telnet shuts down cleanly
Date: Thu,  4 Aug 2022 09:06:50 -0400
Message-Id: <165961841036.1712988.16361195042839008969.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220803131013.3769839-1-peter.hoyes@arm.com>
References: <20220803131013.3769839-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Aug 2022 13:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3645

On Wed, 3 Aug 2022 14:10:13 +0100, Peter Hoyes wrote:
> At the moment, when using the --console flag, if telnet is shut down
> cleanly (i.e. by typing "quit" at the prompt instead of Ctrl+C), runfvp
> still waits on the FVP to exit of its own accord, so hangs.
> 
> Move the fvp.run() call so that when telnet quits, it immediately
> proceeds to shut down the FVP.

Applied, thanks!

[1/1] runfvp: Stop the FVP when telnet shuts down cleanly
      commit: 025fb194f528000b6f2c49a30b126d512295022b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

