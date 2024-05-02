Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB140C04FFE
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:43:16 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.15409.1714660988584385160
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Ww2DUVcB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43ca8e1f990so9464031cf.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714660987; x=1715265787; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57oLbUyJ/s2Qcut5gkjOdgjt8DCWijE1KFoWvf4xEY0=;
        b=Ww2DUVcBm30y6TZDL5GWBmnlwEhyBtGAwL9QhqjOLJJI84Gr61a35WlU4TAbamgR9z
         p8DD573st2QiAVz9p3uKMnyQ7nMotn2HNIR7KiHWCKO5KjKU1Nzh/DH3SMm4pAPybNcT
         vPVzc+79eAVIqBDeBo/DgoHB6FYQNx7vFr+uZTGmJKd+gmc8bwq9lxXSG8FHrYG68fXN
         /dLgWFaOh/Xu9lyMSM0aHsjhFWv2GXnIrXFJXOvkiMkY0rddhtsSJhxq2URUIqBUYufU
         IgVXix328Ng5BY2z+XLD6nbUuDh5hetVccwT7cQCt6c27OuCXocdCIlm8wN60KXLPZNx
         24HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714660987; x=1715265787;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57oLbUyJ/s2Qcut5gkjOdgjt8DCWijE1KFoWvf4xEY0=;
        b=WJeE38afblICI0l4Cc6q+IEgO+z0GJ/noDXaIPSAS0wGbCXr9yrQsEBwBG89ocjuN0
         MsjqBU4iz4yHJZmtdGO3Up7hGLZzrANkOCS1C6gKtVZDTB9mS4yx46RGx3HPVdHK6NBv
         SWRNWHqZKaBnIVZIsFuDAadOZMI9Pn+VKpX9BEk202QGXv1Vyc7P3E/n+j4idW2gs0SO
         OkX7K+kpvYLrLdHziFm/BoR6e9ZrQPE4UYGpa2ZyTRf22ZfYJuQVEpiTefoBoPPPYn1V
         zuja2q8JD3af+Cb32Bdi13lyJL8wP2qTisEWHPwv8mqndjQDWOELafhklHS5j42msJXi
         7mfw==
X-Gm-Message-State: AOJu0YwSBOPpz7wCVHUiwb0TIr5U7UAfD3sOM555j0UjnMPk2OAHbMeD
	bluykGSpTY7X3uiaB09CwucNapWTBAU6MHB4+TUclWB5myv3ueEZuSTNcFG4cEOIx9fYFdu4n4Y
	=
X-Google-Smtp-Source: AGHT+IHNBtPKfIKZu7ykrQ9weIVawZ347I7nn2ydSwjIT/K1MFJwrTZWICOBgB8VlCi7cvhgPyJoIw==
X-Received: by 2002:a05:622a:1352:b0:43b:6b9:a91a with SMTP id w18-20020a05622a135200b0043b06b9a91amr5293938qtk.12.1714660987307;
        Thu, 02 May 2024 07:43:07 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id fj15-20020a05622a550f00b00434946547d3sm528285qtb.53.2024.05.02.07.43.07
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:43:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 2 May 2024 10:43:06 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <ZjOmek2SYl0SAFFC@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:43:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5690

meta-arm has released an updated kirkstone support tag, 4.0.4.  The tag 
contains 2 patches from between 20 Mar 2024 and 30 Apr 2024.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.0.4) with a yocto-x.y.z tag (i.e., yocto-4.0.4).

Thanks,
Jon

