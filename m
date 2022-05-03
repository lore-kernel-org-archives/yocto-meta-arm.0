Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09C9C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 18:27:29 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.617.1651602442968165680
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vDkatdHD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id k2so7736741qtp.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:date:to:subject:message-id:mime-version:content-disposition;
        bh=V5QE6RfQlkkKTq0E3SJuI7JtAg9J3lwru4PebFY9pXA=;
        b=vDkatdHDlygbXxz2piYMak63ab0B5t4rVbGfK8uV0XFLRxM5GIcGp8MV0KGr/bMqFe
         LKFTrBePbC+7KoWHjI0onqOsOaKG0oDu2d77A1fDHtBixQXke1LSBwEQDJogrMZ02GxE
         CBXa/xvAk1B4zf/zDv/LfkCsoWZEEIG/JTkFi3fhCSOOxOOu91oyX9vZNZXbSZr4tWrI
         y9Gk4dTunzXsGB4u6kYMFt5lhrkxTVHj0ymZ5nJ2bPrbG66B0PY4DwbUwNypMWCzEOwZ
         hqGdupMynzIXiwG5VwDORn0mygScyX1F2ltCr/k+ZBX5fC96UWmilWYL11sVdpgn9WX3
         4bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:subject:message-id:mime-version
         :content-disposition;
        bh=V5QE6RfQlkkKTq0E3SJuI7JtAg9J3lwru4PebFY9pXA=;
        b=pT36Ph85hHPXGV7teSOJdcEXdINVCiTjSjvqDv8SjqMFlenxHdJcrpdPbM9HlCKKHX
         laRQTt6Rgf9jVv8dm6ddisRKdbqglpyNADj3DAVB12u6MiEWVvfr3Jmhggz8vN0onveU
         hCYEEoOWZoKj+f+C/ZWX9sMONZ4c2y3iYb4N1FXybrO1PpJGEracncW+/5avMU7nvN/j
         +nIXEr6kj/ek+Ovtm2sUUHIfo+uB+e7P/Fr6/8/8ch46jV4vK3GwHUKdfSCuERxU6y8c
         G4csSlWngnL4+KNS9Ba7rRAu0lnBKNt8t3x9d+ivrPRxBjwrpnj860J5YNegYWIRAyYM
         AyyQ==
X-Gm-Message-State: AOAM533n1Sr1t4wV6w628B7GkXGHZOzzYgrnc4h7zULPWb1H6e8a2PTC
	hXD2XNf6BvmkfHqZi3XM8mxngt++ibNo9Ekm
X-Google-Smtp-Source: 
 ABdhPJyrkFc6aIhB6l4XXMA9BMq43LtoFOR9gMHA//GrKzmQGnPjVVe+XBi2QU5zxPEGP80ROTFLVQ==
X-Received: by 2002:ac8:574d:0:b0:2f3:b4aa:700f with SMTP id
 13-20020ac8574d000000b002f3b4aa700fmr1158532qtx.54.1651602441929;
        Tue, 03 May 2022 11:27:21 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 e188-20020a37b5c5000000b0069fc13ce225sm5521212qkf.86.2022.05.03.11.27.21
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 11:27:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Tue, 3 May 2022 14:27:21 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm honister update
Message-ID: <YnF0CatjP9lEhUiC@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 18:27:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3348

meta-arm has released an updated honister support tag, 3.4.1.  The tag	
contains 160 patches from between 01 Nov 2021 and 26 Apr 2022.

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.4.1) with a "yocto-x.y.z" tag (i.e., yocto-3.4.1).

Thanks,
Jon

