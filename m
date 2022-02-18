Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DE4C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 13:33:11 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web12.10758.1645191190177142257
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 05:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=J9hYkgfX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f49.google.com with SMTP id fh9so14742566qvb.1
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dlACnh5gAGoqkbWiPmbJ06GOmhoQvwE8LMkhzjGtsvQ=;
        b=J9hYkgfXaxa2igoiDgtjSU1KqVPdefbk9oRT8ldrvAgtNCu6aFLh+ouxPPnx4qQeYA
         6rofNJxQQOAm6IIZnJZPt05G4YcGtSX9YyWuk3sYBmhRNSC8TYXsgcyZJW1Av29MiHqp
         L/ctpS13xLbF+FYYJVWl/ViWcQWg0jh5ezGoeimzvvptBkBy5ljKgplelNnGtNQp2JXj
         p6nJYuuJeu3wQlUzp4mpBoFOw9aRszpTC7CuGHbMNrEgwroYPu0Ga0Ccpt4jSmrDKeIL
         DN2gSHw6RDJNS0ZDj7S4stQ19vkpVXOq2+zk/j0k+8AH2FKNSzZSu5pguYFMmkFWGq3K
         6W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dlACnh5gAGoqkbWiPmbJ06GOmhoQvwE8LMkhzjGtsvQ=;
        b=OCUbaxWn3TviHo9lPc8jqLn4dfnhDquBxRf/k77wX9kv7PeeQqilboagneomsDHeMI
         BU4/sa96tda2x5fGfTyE+8ZtitGaNrETMDIs6sI1Pr5UjhVtBPMS3fSH/+6JlH5zcon5
         uaxZkI124A+b+mt4QQEmUQAo5E/RVtjNtTnnl5e+aHu0m5cc2m6PYAaoG2021v+st0kb
         jg6mNJKMW5FyhkJ2BvpM1T0rBakKrggNdGf053Snm5J2Zjvh6xAzJCjiuSG48qrU+bSz
         oWcfApKbQsBY5sO3LqjVPcLUo1UgOlOlYWujZId0kt/iTjlP0C/tIUaJ/bvupftJ5lBd
         +POA==
X-Gm-Message-State: AOAM5331S1PJYKL91wDJrUGcmYegRKhtxenLJoeTzH2NjpXvvnFXyr6g
	PJ0e0+YBC7p75P1/S4AtifQYlsOMNJhg2w==
X-Google-Smtp-Source: 
 ABdhPJxDyeZuybwh+tDCrExZNaplUl/tkdjwHO57zrUuOtcdf0wfAfBswEZ/9S4WB0raD3OYRBzmMQ==
X-Received: by 2002:a05:6214:1782:b0:42d:7c2a:3f07 with SMTP id
 ct2-20020a056214178200b0042d7c2a3f07mr5828252qvb.54.1645191189244;
        Fri, 18 Feb 2022 05:33:09 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:4ff4:26b:e73f:9821])
        by smtp.gmail.com with ESMTPSA id
 h9sm23092525qkn.121.2022.02.18.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 05:33:09 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH honister 0/3] arm-bsp/security: drop psa-arch-tests recipe
Date: Fri, 18 Feb 2022 08:32:17 -0500
Message-Id: <164519113713.2418873.16795602415401250327.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217155953.2569183-1-emekcan.aras@arm.com>
References: <20220217155953.2569183-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Feb 2022 13:33:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3024

On Thu, 17 Feb 2022 15:59:50 +0000, emekcan.aras@arm.com wrote:
> This change is to build and install psa-arch-tests using trusted-services code and drop psa-arch-tests recipe.
> 
> Signed-off-by: Vishnu Banavath vishnu.banavath@arm.com
> 
> Emekcan Aras (1):
>   kas/corstone1000-base: update meta-arm-image SHA
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/security: drop psa-arch-tests recipe
      commit: 2e388235cb96bce4a42f63f266ab6a7ed04b8752
[2/3] arm-bsp/security: trusted-services to fix psa-arch-tests
      commit: 400bd5d5f4e8441878020fe51f3eaa78831b578e
[3/3] kas/corstone1000-base: update meta-arm-image SHA
      commit: 43e5b037e860e450ff4904c325452e5cbf79c13f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

