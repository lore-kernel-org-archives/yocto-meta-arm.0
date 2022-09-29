Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097A2C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:48 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.14239.1664478099177347718
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=aGNKKOgK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id r14so1493124qvn.3
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=sRdFZxp0fbEJZRrw5G63yaVuaDxg7DCqnRR5bnI9gVA=;
        b=aGNKKOgKatIlMbc35t9rKTxTmYuzO0KUGGydWzrjsK0MvbMDzNUByafKrRpZG9uaFC
         VkfwaVAM5XPhLAafQC99FgzjgJhEbQxBO/uPz2DymfTB6omk5LxDr6pkYMS+1gBp9MaV
         7vaGXrR+O7XF7wgEQmjs62YTEo5yPEBbUK/SUvoD/tAFmgwvIiZFFbVnK+aQLhDfEu44
         hAUFj3fq1z27ZcgOEvDBqRYycE7KUbilpXG5RLIhxu1Qr9zyMkfU0d1WfuBA+btaznYR
         S4Pnw2XuCwvvhAZ25JaDcbGWwj+pvw/Nk8hKgg5YAI5ywPwMpzF/qL5NyddGoWuOlCZ5
         2aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sRdFZxp0fbEJZRrw5G63yaVuaDxg7DCqnRR5bnI9gVA=;
        b=uP5+5O0zaqW9q9nwpqVkyaAavRvP2zbB7foTESciKNHHxtH51B2Jh+vjRCx0H4c8aZ
         +ZHpQ+woQ+v5w3gPlPOh8wpUIYZJyu5QpD1+jrFAkhM8rL7sJDHzzz7u3E5Tf321GO3H
         KqW/fUZSVIekeEvoCkuYyaasRhmnUe+bbUHdc58fwvv66M2SQR8vY8R0WnmQ8+paQzYx
         FdPat6/+4NX2hug4Q5D+uO2BcIEtXLqL0TwVwTqOwrBpmA9n17M9//eeD5IFbyL0PPos
         ErwWJXUQfiLOgPBX3Acj8Kxl/PjODqqUI95qu9sIDwQ9ZIiX0wmKQBd7xFzTCpbynWSm
         uQzg==
X-Gm-Message-State: ACrzQf1gP8Gz4V8ieLJPfieLIUmejPoNw063bAY/aBOIVEde9/9hiTOb
	49QnMeazEo2bZpOYjEMEs0IrQp9jrMB04g==
X-Google-Smtp-Source: 
 AMsMyM5310RfmGStY/mqHS+peE/m81nNCh4IR/OxT3/teuklWlTBIHnauYx0sZ5YzOkS01YH1oSvZw==
X-Received: by 2002:a0c:b295:0:b0:496:b91a:f5f4 with SMTP id
 r21-20020a0cb295000000b00496b91af5f4mr3785910qve.20.1664478097868;
        Thu, 29 Sep 2022 12:01:37 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 t18-20020ac86a12000000b0035d43c82da8sm5995407qtr.80.2022.09.29.12.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:37 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] linux-yocto: Add bbappend for 5.19
Date: Thu, 29 Sep 2022 14:56:34 -0400
Message-Id: <166447779548.3284601.9565759812871803860.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220912074647.3445905-1-raj.khem@gmail.com>
References: <20220912074647.3445905-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3877

On Mon, 12 Sep 2022 00:46:47 -0700, Khem Raj wrote:
> Enable tee and arm-ffa driver on qemuarm/qemuarm64 by default

Applied, thanks!

[1/1] linux-yocto: Add bbappend for 5.19
      commit: 75ccc7847d8af5bfff4d6261a49530bb571d1a12

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

