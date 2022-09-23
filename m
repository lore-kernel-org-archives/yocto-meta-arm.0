Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC8DC6FA90
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:32:24 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.8976.1663947143594789693
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=QMSFdvrZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id cj27so247758qtb.7
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=9UxzigY9Oyy8sNt8h93/quDZ7Oa4QzrnEmj72GFGgaQ=;
        b=QMSFdvrZk9o4eGZnJMbQSB9Tuxeq2XmwqbbqprSITt+SHNVP+cMC3fiYPQrYI1J1s9
         04R9lSmrdVM9Kc1dBOFNB6lUY7MZ40t8qSlquCywkV2PP8D+rV8tCOUgU0yhJLfjw0pa
         UdLRUYM0vlpaEYpAkczM4UJ4Pjgz+7dADKC/m/VE1xZ5B5rYnEhW1sp++LFL9exDxiCf
         ZY0G3v+rnB2ph8Q7sd7wGIEb9j9vktnzThk1tCGpWPd9jTtsXMUPwPKGrikwWv1CAH4q
         pRzwSRgzWbuDngCdHezSBv+HGit0nrq8SobWRUfM2JXWL5iZ5hLmdoqtYNmv1weFAJ2B
         XuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9UxzigY9Oyy8sNt8h93/quDZ7Oa4QzrnEmj72GFGgaQ=;
        b=3/yacjen8EFOIhhoszmSZa0Re9zfcq2V1AV7pfYc94Om1TkFVsxE4eoYWlvZALXUsk
         vzTdg9bLASk3LnBF+B4+7f12rGnIen874dx5fSuAmKb3rYI542hIpumAisCacLDtirTA
         +U/CYruZaDnHM6V+kWIcLSqMwpgVdt3SIuhBgsVtdR3s27uwerJZpR80eBipn6YJOd0c
         t119neANRq2P6zr/1K6op5tu1LaKBaAUb5i9Kf79VudOvHrvAsFbcsoZbq/S0tQmUzwv
         aQAn+RMbbmAxwYJLCNTBlT83bWz0i31B2K1pQ5w0cMyXofz5le5/HG7ol0p9zyt8A9x3
         jzng==
X-Gm-Message-State: ACrzQf2KdIOEBqsVX0zdOlr2sZQlWmdWB9R4VfEQA9UxHGzQnztdasBZ
	0oAQKHB1aq91a3QJRzuk2LkCOzBUYwjPJA==
X-Google-Smtp-Source: 
 AMsMyM6tiM0EOIB+jAf+PmQk9a32Nz+gwSTQ4N7DbhU8R0bDyVV4SRTjVm6fJ3kNO7Os/mK0IznaJQ==
X-Received: by 2002:a05:622a:1307:b0:35c:aacf:20 with SMTP id
 v7-20020a05622a130700b0035caacf0020mr7551594qtk.444.1663947142344;
        Fri, 23 Sep 2022 08:32:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 do11-20020a05620a2b0b00b006ce441816e0sm6197980qkb.15.2022.09.23.08.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:32:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v2] trusted-services: Pin to use gcc
Date: Fri, 23 Sep 2022 11:31:06 -0400
Message-Id: <166394706727.2062239.14797707407918369788.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220912062136.3091652-1-raj.khem@gmail.com>
References: <20220912062136.3091652-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 23 Sep 2022 15:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3827

On Sun, 11 Sep 2022 23:21:36 -0700, Khem Raj wrote:
> These recipes are not buildable with clang in its current state

Applied, thanks!

[1/1] trusted-services: Pin to use gcc
      commit: 2c2ed8f727fa194754013dde9e8e566f2a1b7c43

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

