Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A34CC43219
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 17:03:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.110.1635354203339877245
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=iWhZ2FXu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id d15so3064165qkj.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FnCOCk+dqOoa+dVMG5JQv+1jlM9SqMMjDznolLQ0Jfc=;
        b=iWhZ2FXu+S6xWIIAS5WlOHfqyFyBhW9+TECZWJXEAdK/gExs/ZthyoR2uxbFPWG6kF
         BSmYhN3GMaxLLry4Bhwj3U9woV9GsW1353bGUmkckBdrm10F2+JbhbGqIHA9aaDg29cw
         KhsAyeGctD+nIU+eZUv0HG7psNThoGqAtS3eJo6/nBEPfVBE3mBh1m2D3zvv0r66QcOc
         wM/sSCnSBh5KOjexIHMe62IccZ05nDcpSvaVPB2MLdsuKbrcPS3WkOBhdVXFm+3vOurv
         vtIDe8JBY2+pGhyoJIS+TZXEOoWx3kp9ox/8SRVSHJJOxlbX8SBFsjtGQd68vziINQkp
         DEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FnCOCk+dqOoa+dVMG5JQv+1jlM9SqMMjDznolLQ0Jfc=;
        b=TxU4QY1JlxA4MNyH8hC73rmX6Xsce2/nLP0ReFfxW+TpzNVTGtM4HlL094IcASAByq
         aH/x7LVq9y4L5zASj0zRC6OevM4q0K83J0lGXNR9jq85jVXlbGOVT3Etu8wjtaoKUZDS
         azXWB9Gi/7WhIMMgakT1zspzVvPF0fcogmVDrYoRanFoKIGsLJlnd+HwHTFuViKAwAoJ
         1CqNbomCs3kbh5YU3H1PqBW6xygbpBUoFYvR9bG1owQJ4ovbwbb16IGkjdxqvUjIL4bo
         9R1eJZFbllnYSPBh4Nx1HN3z12mmP7+l4aE7dhRcMWieRmvaryiClqZ+Zffw7nOc6M4c
         gHCQ==
X-Gm-Message-State: AOAM530sAxA6w8CLpHuENR7XOwVUdiLs2HncFMfeSMhgDxkkiR2+Dia5
	Phnit1n5j0c1xtN8oXIYtcEFU92xLlZuUw==
X-Google-Smtp-Source: 
 ABdhPJzoAvv4KMEjSbvzwO5aDOOOaRjXyaWTDlIf1kdVAWuZhdJY4ChrgOJ2U9s3wyt7crbx2W811g==
X-Received: by 2002:a05:620a:1a28:: with SMTP id
 bk40mr25745040qkb.224.1635354202335;
        Wed, 27 Oct 2021 10:03:22 -0700 (PDT)
Received: from localhost ([2605:a601:a618:1500:40aa:523b:a9b0:877b])
        by smtp.gmail.com with ESMTPSA id
 r12sm334653qkp.11.2021.10.27.10.03.22
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 10:03:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Wed, 27 Oct 2021 13:03:21 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm dunfell update
Message-ID: <20211027170321.GA17279@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 17:03:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2308

meta-arm has released an updated dunfell support tag.  The tag	
contains 19 patches from between 23 Apr 2021 and 09 Aug 2021.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.1.3) with a "yocto-x.y.z" tag (i.e., yocto-3.1.3).

Thanks,
Jon

