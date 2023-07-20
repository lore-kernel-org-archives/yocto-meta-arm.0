Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505B2C0015E
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 03:02:33 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.5063.1689822143067706845
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Jul 2023 20:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=4+TtgWZQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-403a7066d9bso2913801cf.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 20:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1689822141; x=1692414141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCgkqqPG9WATQTwx/5BEla1WwWYMtgXtnBKa5EIUmfM=;
        b=4+TtgWZQbM2LaJ3aF6/xedQlLK3YWGS7bpYPlnzAlJy1DDDUgBcWXhrsAvWJY39oL1
         K3VVeabdCZ/XjqguDcxiDRlfwYbHLDe70T+KAS0R9gEqkZMBST5k//VG3kZ/VAgzOxuf
         1kuPGjCdxKajkrxixujZOBjCV9qMlJgbBcLcN8vkBPspUDKx55B/+UPb7zF/2Nuhypmg
         HKP1wz+MCAbLiJaVcQR/EfuKYp8rHdITdz/+7zUKMV+gUFfSOy59rwWt5zANGCKXpmrD
         096swWa0Qh7RZe9sZiMtflygb7l2QhQeaJl0u+pMzd3QWZAjUqd1lfhbkI1GcR3oLUdb
         oGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689822141; x=1692414141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCgkqqPG9WATQTwx/5BEla1WwWYMtgXtnBKa5EIUmfM=;
        b=VTUN/ZhTIrQ0TTXGCOCr+0LT9V1g2603XuM+Z0uaPR66LIq1/ZviWuLVvv/Z8g2wg7
         a6hj2Iau70bZ7TWXvwBF0uuIQAUOQEWcKOnyG6hUwQDg/4sM3s5NbTKQ5F4KB0KGOfiE
         ivNjg6Cpmco/+m0/wgJLQkz+Glw46Dw5rGY5rs3lM66JPibreLVcnFXnY4hD35WVQmEQ
         M9ArVwSECQbdEacNNjerWpOlwMkSucFiNa1LEFkMbGUM1cpHDlTRgCikrv9JZilGddCB
         CIup7bVi/w32DJfpxvMZRdkv98rkIEovhlkY7ccz000gtKnWlDjwUOW7eSyIkXq8/Ofj
         DN8A==
X-Gm-Message-State: ABy/qLbNNFmQkQPYMrVwAea0jEI+0dQhWuJb1hXlVDuroHnYYe8BAOBJ
	Rfy6Q2notQg2lot425fq78CSHbXI16REeRlZ6ng=
X-Google-Smtp-Source: APBJJlG3tQGps1fPEmo9xJH4IEBZI0DnXHmZ9IetLq9Ik/jBiSgQtwZKrqlDRiQHkRQGNny9ubQ/gw==
X-Received: by 2002:ac8:5914:0:b0:403:ae76:d0a3 with SMTP id 20-20020ac85914000000b00403ae76d0a3mr23184312qty.8.1689822141592;
        Wed, 19 Jul 2023 20:02:21 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id h21-20020ac85495000000b004053dc8365esm29263qtq.23.2023.07.19.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 20:02:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/optee-os: update/clean-up patches and recipes
Date: Wed, 19 Jul 2023 23:02:08 -0400
Message-Id: <168982212997.2718612.1948435423919933509.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230719130215.3572270-1-jon.mason@arm.com>
References: <20230719130215.3572270-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Jul 2023 03:02:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4908


On Wed, 19 Jul 2023 08:02:15 -0500, Jon Mason wrote:
> The optee-os.inc was including patches which really should've been in
> the versioned .bb file.  Move those references there and update the
> FILESEXTRAPATHS to be more intelligent.  While there, rebase the files
> via devtool and update the file names as necessary.
> 
> Also, remove unreferenced patches.
> 
> [...]

Applied, thanks!

[1/1] arm/optee-os: update/clean-up patches and recipes
      commit: 4616202e8389112468a578945ba218c001491c67

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

