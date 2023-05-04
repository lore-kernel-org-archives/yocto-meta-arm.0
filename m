Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09679C77B73
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:20:50 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.6860.1683235240484927489
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 May 2023 14:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=MMebGcO0;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-5eefa0a5561so9347926d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1683235239; x=1685827239;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqvKEYc9vwA2fjuL7Rpg2lHBastP8jdrdmKxlGFYJmE=;
        b=MMebGcO0g3kDOItMLrmfC77ibRrlI63nwwCpUcfR1+XDKqi2fMFBT3pvTWi101z9SM
         qdQZ3OzuhzzIicpYtoVYdaTG+2pAgg3OiCPveVakwMIGr7Fd66rtRcngE0SbRg67FRHo
         83XQd4AYLcKUchVBVYl39ASzJuOeWkho9exfAd7WraHSPobEOjz7GNxPP1fwM2tBXePk
         +tuDakn+DdK9V7E2MHA7jb2SlbJt4fwAwrWZemlWzHTqWxu6vtC0ZHdo5VBqGRn2ghAp
         GPML3xlTPegVTFxmBiIwScn4tsebHC8Y64c75ELO+9lpNAD/E0b39sNbWob7ww0G6NYc
         0FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683235239; x=1685827239;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqvKEYc9vwA2fjuL7Rpg2lHBastP8jdrdmKxlGFYJmE=;
        b=XSm8OV9M3i0Yqr9UAn9OMjx3wY4kBmUY26zXiXvDaf6k5kuB9LyqF7gI0HLwcjrLLf
         rSQy2QWVX5JYK80tizfRPCRAqb3AdnzDL8N+uwj//YqEE/9mY1BOBg8enwDlqnI+eVKw
         +/Pn5JVLmGchlkuWogjvJSBN8DVNeAlZ7p//EnJgILKxN0axAKO17dd2fddLncR75fZX
         D6XGl1YRkTq05qE6zkJ/D/UZefOA/WPJXYlXhTiq+gaR/lFVndDes8SGqDu5LGZFFZDF
         U27950qE2O9flgh4Bz+7Ja0C41hjKhfD70wh0zLC1BZ2Xd/g0z6BiYuWa6511qWkVkC+
         pWYg==
X-Gm-Message-State: AC+VfDy6XJ9JrAhHPX97GFa0glmKdfiF6/6IHDRN34JM8hFkksR5rfaV
	WVdec0dTxsXNUurHaXNBZVsXKVX+eiTpyPKEV9s=
X-Google-Smtp-Source: ACHHUZ6+oikdVyrbCayLAxxDK9a5XNkc1uUZm03aCifxFHaLStpXKPn5HsKuE7jnQFHl0jl8jMu5wg==
X-Received: by 2002:a05:6214:2461:b0:61b:3557:a695 with SMTP id im1-20020a056214246100b0061b3557a695mr20339572qvb.45.1683235239122;
        Thu, 04 May 2023 14:20:39 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z30-20020a0ca95e000000b006041dae6844sm33481qva.96.2023.05.04.14.20.38
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:20:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Thu, 4 May 2023 17:20:38 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm mickledore release
Message-ID: <ZFQhpoLCYawQ+zE7@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 May 2023 21:20:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4639

meta-arm has released the mickledore support branch.  The branch was 
forked on 04 May 2023 from the master branch and was tagged as "4.2".  The 
tag is GPG signed and my public key can be provided if someone wants to 
use it to verify.  Per the previous public discussion on this list, 
mickledore will only be taking bug fixes and be passively maintained
(with kirkstone being the actively supported LTS).

Per an external request, we have duplicated all existing numbers only 
tags (i.e., 4.2) with a yocto-x.y.z tag (i.e., yocto-4.2).

Thanks,
Jon

