Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9722CC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 13:49:25 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.13593.1747403355782329809
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 16 May 2025 06:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=1NZ6E+Tv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so14316126d6.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 06:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1747403355; x=1748008155; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKFz/DPM/aU4dcbcjAED+TRtWc5CPLwkW7fxKgh9cto=;
        b=1NZ6E+TvWxyM7LQqMYuBoGzX0+aw4Jy3otCqccKA6XlCPYewTv4aAK76O4NqTj4qLj
         XX1VB66ObOcOT+HDvUdAYvuTPi7+SlP3bQFGlVzvM5tv2aWS1w/YXX2y1E3W8awidnLF
         TXzTH4S+OHAaKejtYdOWBJGMtmmd1FpioXd2re5Hg+KsVfPLXtoZw4G/gB+/vbE2dQhC
         R9I6lb6PcojiJypqaMGiqM1xG29FZihIQKLPup0M/ZEYd6MAmZ/svb0nekl67ekrYcL+
         wudb/4eExOIC4tYzc/KVjKzyYHho88IV47O7BDeZTiznmv0wTbO9Gx/ssuG26xK5kmit
         A6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403355; x=1748008155;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKFz/DPM/aU4dcbcjAED+TRtWc5CPLwkW7fxKgh9cto=;
        b=CrSsDQm3PLo62CnWf9kp1SKAS2JPL7zvQGyn92j4G/m7k7bXrReGtJbrkHsVIYCNJL
         JoGaIsJdB+MjxFZzZ5kK3WalPyW6oPw4ntCTpV4/wmmk0mD+30P4ki9I52gBlml19thF
         N6BBGvjpRadfCViwo/tHgYmCHAYs0Cf0evNl5AZlkFeZ6PuU0YZ8s8ae6mLWZxxLLeFK
         AOxy1TbpwKO3XcIZjm5A4461rGd/eNNg/nmpH/hG0Q02NwkEb3NLYsYsiNbXbFpVUTDG
         dQRLif4oi7/BwURhc+uBQFAOf+qfyp2fH63taoov88TgAEv3r5gIXAjiuKWpzbqiMFgx
         MxTw==
X-Gm-Message-State: AOJu0Yy5LmdPXrPNZ73OkspC+T0H+lFrFFMwJ2KV0kmCshJCVfvRcpFa
	9NFgZKnTcCw80TVhWEQ0mYXjEg1mjflks/e5EHGqqEGEVRdEa3OTluoESS+nz6oaBlALuUAoSYF
	Gi7z7pw==
X-Gm-Gg: ASbGncuit86LeTDUCVrrHw1LfxhOJnROM4V1nf+yE0VnIRud84+0U5GrLCRRbt1p+xx
	NsRGGROWF8HCAx6AzwNUvae+NhaTrXc2Ug3LkwB6wVVNr+puHVC7+Flji4hDbDkOTuPx5s++f3L
	7957O5KcTcnADDxRI3228Y/IXtm0cW1w5uI09QhnEMxeKHUAfrQLpxqZvNSUOhxoHZ6cAr24REJ
	naTucpHS1sl670gxhKkhzHVW39ktXeE57G+YnPbKCEm8u4CYWNib6LAvbPqlKuWFmhLx1r3pMz7
	OTZ9gRHI/8TETICEKgMR4VHQGqwF7IQ8rnbrIb6E6U0=
X-Google-Smtp-Source: AGHT+IHJzzeoQ7v4r/U5zEkvNdUg2HaFuuE6W9BRe8V9LfZr6S49dsxwrYA6PZkb5M4xg4kFjrE4mQ==
X-Received: by 2002:a05:6214:b65:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6f8b08662d6mr79004366d6.13.1747403354575;
        Fri, 16 May 2025 06:49:14 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096571esm12255736d6.73.2025.05.16.06.49.14
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:49:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Fri, 16 May 2025 09:49:13 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm scarthgap update
Message-ID: <aCdCWZDheke9Bu_A@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 16 May 2025 13:49:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6502

meta-arm has released an updated scarthgap support tag, 5.0.2.  The tag 
contains 19 patches from between 15 Oct 2024 and 29 Apr 2025.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 5.0.2) with a yocto-x.y.z tag (i.e., yocto-5.0.2).

Thanks,
Jon

