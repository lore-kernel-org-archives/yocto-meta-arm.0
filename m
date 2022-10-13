Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432F8C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 13:11:53 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.7266.1665666704225455130
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 06:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=d5I7WrE4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id l28so941145qtv.4
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 Oct 2022 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYEzEoSfdakC6N/Knuic2D9maotlZQQCvoMBr74Yyls=;
        b=d5I7WrE4xA6A4EocDukTPm2dX5Saco0qS7lCeuS4uf9/JMRHN32zZ+zLWpllUbreYJ
         tFa97mDXeCFOKx5i4zir0+FDadvu0fl4DrV38RVgIqwAVlhIMAZeUcASFQtA4Nd+Gc/N
         C4VAshhGQbi+f9xwS4LuEiWAjr6yJ4YcFry7OpBDg16Md28rbH2X+CuBEGv61rfh89yU
         CidOlfS52c2ZX5Zhu653Twu5p2ZuZ+hdjU4pBg1nM5uvn2Tazw+2zhc6AtXl5zzJmjLu
         sRvkqbCYWP1CnkwUTJ9mUpm09WRYrJCi1R1hy942JBVWotNDj21R0nGEDdu90p22CA+d
         WxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYEzEoSfdakC6N/Knuic2D9maotlZQQCvoMBr74Yyls=;
        b=End2t8GlxnFIY1jUMgSgit4ZKlNhCg96e7JOkv8BrwkFa0xO3wXtZfOw6oqaGIF7ED
         W9pupTLKlFIdpoUskB9AUt4BmHyXFJfb7GyejDMRoCZSXBaLvyZA5JzcdkiUbTlDOZet
         e4CLAvqSEHcS68qOxXREvPZv9GAGvdxOw4sSNwnqtg5xAm/WCWalylyuuNqROTJV+j6c
         Wx9T15nPNUooTF5XVCn7bUW8WRMg8lKOq8LJOOJp2bahXWSKp1Fe31JtR9kYRIqF1/J+
         QccOf+iKYyAn1Ee48XyTg1V6KWjzNZEnTWEjEzGY8HqkiHInHY9H6FiLMb/EvEf0B2sl
         8gCQ==
X-Gm-Message-State: ACrzQf05O1Xcr77nO9ommfensCjPBAKBZ3PAmqthSjEfAYIn04kmn8ik
	QyfUxdGm/uKK1cqSKpST64WlwcdllUxRZA==
X-Google-Smtp-Source: AMsMyM4E2Vu/rCmdmNuqhnoz4Lrl+xo+PwAQI6Ekyms2wRaXU8LDFoxN861z2cqt6D8hyifwwDRUHw==
X-Received: by 2002:ac8:5a90:0:b0:398:dd09:2e41 with SMTP id c16-20020ac85a90000000b00398dd092e41mr19850863qtc.108.1665666702884;
        Thu, 13 Oct 2022 06:11:42 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id n1-20020a05620a294100b006ee949b8051sm4942214qkp.51.2022.10.13.06.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:11:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anton Antonov <Anton.Antonov@arm.com>
Subject: Re: [PATCH] arm/trusted-services: Remove remaining patches merged upstream
Date: Thu, 13 Oct 2022 09:11:37 -0400
Message-Id: <166566669787.4098267.14978177236415730802.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221012195020.3360867-1-Anton.Antonov@arm.com>
References: <20221012195020.3360867-1-Anton.Antonov@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 13 Oct 2022 13:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3959

On Wed, 12 Oct 2022 20:50:20 +0100, Anton Antonov wrote:
> 


Applied, thanks!

[1/1] arm/trusted-services: Remove remaining patches merged upstream
      commit: f8aba2d5f3fe380c807c52fa57c14deea36a9324

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

