Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF505C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 18:26:59 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web08.587.1651602419029608172
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=58eBvSZr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id a5so12835299qvx.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=VjXY5s9oUefcCLDoR28PLvS/iiGKKIxFY+xDmV1SaFk=;
        b=58eBvSZrS3NFkq+6dT8SP9Oz98NfC2c0KvW4hWwtLStpgtGOO1QW0niD9hIKa7ClEg
         1r8dVo0rJojfsIbsCHHq1TbEPv88nRJ3UbScnQCZGyi5GPPP2JomeSceb7v1XqASjN/o
         EtipBiMMNh0+CbGa1o9DcPSpHvLmcsnvb7JLN2PLuYAyzbXMDzc3pCNXOZFKEqyN2MwG
         Ww2/YSzH0JP5qWVuDBX1vdu40aCyhdw9pn2JPT6PEKk48eO/BmYlGM8Vp26LNbZ/qi/s
         do7+KtW0jsy4ycodLSZvLJ6dIE2tQ5IIJwWo3NTJduF3Dw6cq1WOsZFFsA9qP3PzVKBH
         iFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=VjXY5s9oUefcCLDoR28PLvS/iiGKKIxFY+xDmV1SaFk=;
        b=yovCzp6hT4jy0ftoba7RiG7Vp0ljRqcTf0IEtK5YhOg5mzmIcAWT2jvkU2M/b3S9Sd
         bNoHUOhjOorSiaTL6VdphQ9vOFqgUMdIGaTJSWRluiJFLo2HFXFqoFi6YW7GSkKX9Klx
         S+M6Uj9T1s60/XSrX8a+tn3BEATxhzio/zwnx4vEhP/SaU6NHRt8lD+R7KKDj7BvyE9V
         7FG1rGSrCHU9t5MVh93CSAlB62x6VB2HoXhVNMvBQ3VPK3v+gEKimtQHWtRRRnI6L2vn
         WD+XSJaUnwQFNN/d6hHSqSTKutLnasSt/DjeWBEUJFdL3Q1Ate+6bi7Wvxoe+fNgBrZr
         Dzuw==
X-Gm-Message-State: AOAM530vxF9WBlwHWykpkCCPYSDnqLRVRrfAtA+mj8x8BCt+XAGfCT64
	BIecfEsU3l19Bz+dUk4GRCdp6W2pIIt4rem5
X-Google-Smtp-Source: 
 ABdhPJxCNyGQZjafY/a7HPeU1OFBkeFtCUY5JnL4rrmQUA1ti4J6v2RA1x8gg0uwWC5Kch7Nn9zBgg==
X-Received: by 2002:a05:6214:d48:b0:45a:9629:d5ea with SMTP id
 8-20020a0562140d4800b0045a9629d5eamr6655334qvr.127.1651602417438;
        Tue, 03 May 2022 11:26:57 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 y62-20020a376441000000b0069fc13ce1ddsm6108250qkb.14.2022.05.03.11.26.56
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 11:26:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Tue, 3 May 2022 14:26:56 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm gatesgarth update
Message-ID: <YnFz8PVVMjwP4VXR@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 18:26:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3346

meta-arm has released an updated gatesgarth support tag, 3.2.3.  The tag	
contains 3 patches from between 28 Jan 2022 and 11 Mar 2022.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.2.3) with a "yocto-x.y.z" tag (i.e., yocto-3.2.3).

Thanks,
Jon

