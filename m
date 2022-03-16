Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E37C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 13:43:19 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.24908.1647438196088017688
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 06:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bqEpCLp7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id y15so1714419qta.13
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 06:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ZHfrOkdEStSorxG1xN3B5XcY3W9v2P/TUASS6M+2R88=;
        b=bqEpCLp7BYsmGB/EdIlxiCSdhE2bbtuqQWwRa+6bObAniAMYsNAsskgrUY4l3KdRry
         +x9MOVfR7TqeEyoELCmveQfWiuOg5lKOsB7bTGgVrVmN6g+qUd6rParclwIktHFhGUZm
         yK9tgngAmXTVBpdFXmgiwtSDvIzjKjWkj4JLF3rr73lrb9jMmvGiU1q9P6E9XiI4jqHb
         KXvk/P6aCFg3XLV+r7LX3v3pAENB8pS9aC4u3neQzCljWE36kiNkPdN5qITFqH4UyZdn
         7lpn1l54IJXYLHF0f5gbmlbyFvAXAMFEqrBoZ3AoOO3/1NUz4wDgkUr+ELyhNExeNl9g
         u1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ZHfrOkdEStSorxG1xN3B5XcY3W9v2P/TUASS6M+2R88=;
        b=42iT7bkdZItdlodDjqzwC46EcnLFuvddsPo/UDIt25rykO/WGOVah7Fu/TNbgsedOY
         H7MqIJGNFZwRx6FTFcyV3QNzuLpLhjk6iwgw4aXTZKDsESd3m3kHeOMqnpG69n28Czbb
         TFk5DP0zWwxIimxLaZlnltiVD8RuvDmE6ETzFhLrpXEnExXLWLs80vwszvXRIwlmMxFj
         cm/9uJ3ukbAt+6PiLUzbsY+N53qPvDMjAqNkpvC8GgQjM0/hQS/BdikzXiZF3RrdJdY/
         Grpcm9F58aM1xBmNGTYMFkimZS0+ScCRQuyau3CVWTmd6Frn7Id/EIH/eUxIlyQJ1L/4
         nq3g==
X-Gm-Message-State: AOAM53347nAu52xIGe+5OghBtEkb94xWf/C75wmMHQ4lJM2auN4df4WO
	eEn1Ue3qoEyxOZlRqvIIP7Zb2fgx24z5QJ0ePT6bkB9MZFM=
X-Google-Smtp-Source: 
 ABdhPJybB0QFpd72UkBMvp4vG58YqCk/6htOcSHFPRJFOmHBzIwt5NCt8Xeu2AL39XpxbWf+MGkEOOQw03HDhlXWEuE=
X-Received: by 2002:ac8:5a04:0:b0:2e1:d39d:61d8 with SMTP id
 n4-20020ac85a04000000b002e1d39d61d8mr15529qta.363.1647438195105; Wed, 16 Mar
 2022 06:43:15 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 16 Mar 2022 09:43:14 -0400
Message-ID: 
 <CAPoiz9x=pTFvNeoV6ABC=UqYX+JJfvLFUag2osFQYge2AVYxxg@mail.gmail.com>
Subject: meta-arm kirkstone release plans
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 16 Mar 2022 13:43:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3176

Yocto Project will be making the kirkstone release in April, and
meta-arm will be making a release to coincide with it.  To facilitate
this release, we are requesting that:
* All outstanding features be pushed within the next 2 weeks (deadline
01 April 2022)
* All bugs be addressed in the 4 weeks following the feature freeze
(deadline 29 April 2022)

Barring an issue or something on the mailing list that is in the
process of being integrated, we will cut the meta-arm kirkstone
release on 29 April 2022.
As before, we'll be tagging updates for all the legacy branches on
this date as well.

Going forward, it is our plan to more tightly align with the Yocto
Project release cycle (instead of lagging behind 2-4 weeks).  So with
the langdale release, meta-arm will freeze with M3 of YP and release
the day that YP does.

If there are questions or comments, please feel free to respond to
this thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

