Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C2AC7EE29
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:11:19 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.6634.1683234672452999548
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=f0N7TdRU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3ef112cac17so4459041cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683234671; x=1685826671;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/t7T2iyv92kZDaCF/nA71d7HcDEdehjCWssFAqhdPSU=;
        b=f0N7TdRUxtBO7zgGsAGYlh8qxKnKAsb0PKienf5Lrrdr3boZnDMLb9gAlbIPTd3cyB
         pEUVx+l27N8LcNgB7Gcvhx7xaQdXQ/FR0rQ7HatG2f+Y7YB9J0OoH4BlGOVykP8Ri2Pp
         lLJaZ17eRivU56b0o/YsR8tjZFuhDRlEkyANNl6RjEPwrtJcHe7Zl0yC8wADw7EajZsA
         BBurh7LkTwHZkX45r6jXp7ptVzPSADABnhysLGB6LzyJ4OBhKJaPTM5TfpO42SOAGBTl
         RPSL2s3V4S4cs/4D5n3a1uXdonH69JnvedRfxZi02tItIAoRLS35WTfEtqr0GXKcH9DW
         boIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683234671; x=1685826671;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/t7T2iyv92kZDaCF/nA71d7HcDEdehjCWssFAqhdPSU=;
        b=bQuNex62l+FJlHC+2hV6ZKRgSqdJPrB+9ilVuFXEOYJbfrmJUxewKr16gO9e9sJeEX
         sQt+CnWjO/f0iMmoDhvzF0SpSE7ngj1xotq09HuaSw9CI5iQX6GGbCFhV6wleTB7enrd
         c4yPHh2y0RMQDDB6tX2vKY8o28EcMGwDQvju9pUvHNMLDsLrmfDauPpzuAVFdeVznRXX
         jjk0EtEjxLRCsU/VP10XkOFgBk1F94Zm4S+sLE4npg3kqdsYUXXH2u0PANhqbt6Ckxl4
         HrUw6KiJ4YARl6dnAP7EwHHckEhUL8RWTOr2KKTPJlWIsgx4uwdoUzSkxVXaCOmWTssH
         NUsg==
X-Gm-Message-State: AC+VfDzMr4iwBVQm9Amn5dPos/CFI6RVzqb3pyqM22NRp25VTHXjChPH
	CF7Wfo7TOQuHRAKYWgAg8rQ1nUYG8EcI/eYpSQs=
X-Google-Smtp-Source: ACHHUZ6ZDrylnrYbkRujCGgzliioR/SAdINL6YBmkleS/tDkaINYLMBav1htrjO67fVl+0nS+4aS+g==
X-Received: by 2002:a05:622a:1447:b0:3ef:231c:cee7 with SMTP id v7-20020a05622a144700b003ef231ccee7mr7246980qtx.7.1683234671212;
        Thu, 04 May 2023 14:11:11 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id n14-20020ac81e0e000000b003e4d43038e2sm4363qtl.5.2023.05.04.14.11.10
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:11:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:11:10 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <ZFQfbjaTls7OZwyk@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4637

meta-arm has released an updated kirkstone support tag, 4.0.2.  The tag 
contains 18 patches from between 14 Nov 2022 and 13 Apr 2023.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.0.2) with a yocto-x.y.z tag (i.e., yocto-4.0.2).

Thanks,
Jon

