Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F9C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:16:38 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.13596.1646327797951726492
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=w0ksRkPG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id jr3so4622887qvb.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YJffS0w3XNYBh5cgPmt/cA52zw2QIvccrebTvLs+RPM=;
        b=w0ksRkPGfQwbBizvfAZaJoh/wypYuoTqh70F90MofU5xUuEN01wKvnxkCyVn9YudPA
         ZCw7OZ2TUxtR+So5v2cf3XNEoW3kdbHl62oqrylO3QTwqiCr8GrVgiAJAqFV2zkOacEb
         hdsO3IwpDA0hBKTgjY45OHfwXQB+ss4I/hZiX/Q5CbxtofR7W0oXGGP/Irio1/p6sQVM
         jaVd5N5EkRyhiCzQYu2vv/qx3Cw2NsUuuCxCEV0aDuzLIvSZbIm5dIAJObn45hJBq5Rf
         AQ81bKaZkNn1sA5N/aEt4GBQNxfmvEdDIn9VxPtftcqXJPVeHNKKjP8Qsk3y0sUVB0ZZ
         ybyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YJffS0w3XNYBh5cgPmt/cA52zw2QIvccrebTvLs+RPM=;
        b=6nE4JNQRznKlbBWfNj4jTaIzxZxsz65SSroDH69KqoVgUfZo3kSUad6WTmaCiCrZI3
         maya0ZwDZfmwoBkZPfK7mbjqIxxAwKI5UB6LIt/HIVeIXcza0SkRO2EKGssu0at3jETb
         Sj3sxs6iiJXP2JyB85qxbwr5J+bAFxpTU3z5zRv6LLYebRgOODqnWPqOr17oeC8GTFuX
         Stwt74PnyLK8d8HWLL6JHNMfe1e69qyjIJqF/i58ZQLrvDOARDuRTGhhKFxUIf8qCV/K
         GyyuHmITCv/1emfxrTradXh+SEavxduKi1we2cRM8hCYdw+tW008rEMrHLq50hYh+KEU
         DG+A==
X-Gm-Message-State: AOAM5330vThsBHyDJU/TEW6g6Pf2xtsJ/5IeWp2/GjOcEF9u7fyinKXX
	yB4Aav4SqnbBS46BtjnEnOKbG7EjSEtSSw==
X-Google-Smtp-Source: 
 ABdhPJxq90KTCU44j4m5X3wEEx21q0ui86ASOQeuL0wHK66Tp+AZnTXvpF20kH6FQlAGZH5XEv8bjg==
X-Received: by 2002:a05:6214:27c4:b0:435:3245:3a64 with SMTP id
 ge4-20020a05621427c400b0043532453a64mr3384022qvb.91.1646327796563;
        Thu, 03 Mar 2022 09:16:36 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:cf54:5e99:f9d3:d9ad])
        by smtp.gmail.com with ESMTPSA id
 f14-20020a05620a12ee00b00508b2c61482sm1278293qkl.25.2022.03.03.09.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:16:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/fvp: check that FVP binaries are present
Date: Thu,  3 Mar 2022 12:16:22 -0500
Message-Id: <164632778401.2165565.4340472381834693678.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301161604.1959493-1-ross.burton@arm.com>
References: <20220301161604.1959493-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 17:16:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3102

On Tue, 1 Mar 2022 16:16:04 +0000, Ross Burton wrote:
> If any of the path computation goes wrong (for example, the compiler
> changed so FVP_ARCH needs updating) for the real FVP binaries then
> bindir contains broken link called FVP_*.
> 
> Solve this by checking that the directory contains FVP binaries and
> error out if not.

Applied, thanks!

[1/1] arm/fvp: check that FVP binaries are present
      commit: b9fefa2482846c0f2ee43cc5d791989b3e486850

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

