Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E49CFA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 14:48:22 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.10004.1667227694710314105
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 31 Oct 2022 07:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=liae0692;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id t16so8446151qvm.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRpftj7I9OUV8HHLqaDwddgF3CVj5dV3KTr87eObbXE=;
        b=liae06928RHwOStCjQK9l7bW0ffcsPnJ2mCh8a+WVMVYg7eXPjgC31aNLIZVmsHsDS
         hSENx3mecdvpsL5zPdx3D4CgFIGYQMDv5A8a0Xy/jn+qeBeDClS8IYKidc5S2cbR7dTg
         q2pkk3pbX7KZWlM0GwHNgf5sIrod3k6RZnGVtBw9/4ZI+u+6qpzA5Nhm7MGHfK9RQQ7U
         /ZjRVom5UH5Ah1zumHmgWb7Bgg9VxLmD9i99MYW9Zi/Lm6JJ/Wt0aB5IZn1m4yLpYenY
         hTixWpkZ8uNT32T1nIS/B78NK34yAmRFNVW1Fk0DpmWIErJePVHh/QtYUQhTUGUfsO23
         gxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRpftj7I9OUV8HHLqaDwddgF3CVj5dV3KTr87eObbXE=;
        b=Wba8CyIfo8hC9MH/EV3nfxtll3snX6+i9/NRPNMONdk9y616MBG+5fjCi7//j6EM4O
         7thaMXIvhXjjS38NIjlg13qDTJuGN9hNbtKkkqba5HMVtu/2b98o5eFO7YRR4nel3TRL
         yw3VsWD8nd03Enz6iMC4LL9wpQHSCj0COps78amltbsQubcmOmDiV7SMQB/GjT2rUONG
         Hl2LYPA+Qmw5+GH3QfM2tJu2BR2/MgXjGffSqgm0beYqLep33lyCxWlelM+CsqLYe2Bd
         6tSGUuXjhqaspH+jy2qbv8quOzYcYwfgaxRb16LeDGFcjwk2pvWYUjy5H5O90ap65NAd
         +cXQ==
X-Gm-Message-State: ACrzQf210BduggJrWRdUcWAm8LwSVxJXBoj65bHNuWoPQpyx7bivYn2y
	Wv0+d0tgZSt1OFxiWzeJnkxj3+3ILVfmhg==
X-Google-Smtp-Source: AMsMyM5VIq3ZiExFBSyATEXaBPWtwhu8utEPbPxHSxvK4xoPfsSDtLhW/c2f9OVYRxm0VX5mCf8U7A==
X-Received: by 2002:a05:6214:1cc2:b0:4af:891b:4e75 with SMTP id g2-20020a0562141cc200b004af891b4e75mr11099534qvd.30.1667227693335;
        Mon, 31 Oct 2022 07:48:13 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id bj41-20020a05620a192900b006f7ee901674sm4830611qkb.2.2022.10.31.07.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 07:48:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][langdale] CI: track meta-openembedded's langdale branch
Date: Mon, 31 Oct 2022 10:43:30 -0400
Message-Id: <166722740971.3988070.8691008981391860016.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221028154533.1480102-1-ross.burton@arm.com>
References: <20221028154533.1480102-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 31 Oct 2022 14:48:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4064

On Fri, 28 Oct 2022 16:45:33 +0100, Ross Burton wrote:
> 


Applied, thanks!

[1/1] CI: track meta-openembedded's langdale branch
      commit: 4ee457693ed01c1c22e4244ad930732128511c2b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

