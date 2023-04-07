Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8F5C77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:06:15 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.8826.1680876368167422792
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 07:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=hVQMiwh8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.51, mailfrom: jdmason@kudzu.us)
Received: by mail-wr1-f51.google.com with SMTP id r29so42377262wra.13
        for <meta-arm@lists.yoctoproject.org>; Fri, 07 Apr 2023 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680876366; x=1683468366;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weRVGUeMPOMpIvMiLVH2eyJeEKBQoW1ACkS8HX5VFs8=;
        b=hVQMiwh8FflkHsZxq65nfuNYhMTuVvZRdTUNGszOhimozeifSXg9whMaWI9/VaiKNA
         TMwmrWxcty61rbed23VKJcopgZLME740LhWYCMyJUnZ/lxnxdznM/g0xo8jjOVokufT0
         0NwTf8G1junKZYTBZHb5dG9s8+6RMF34nbUgGUMCQ/+FtIAo2pYjm+TZinj8iixhZuUP
         J+2JWkCb37yUXWB/FuYAZeO4NPcRasGjTULLftc591WuDRndEUKaG6wRcD0blPp3crvn
         vjv2Jz7XnCx0xaud9PWTeIxCoItA9SlE8BxUDtEpqu+gw3ziHWg98eyJW0Hes0gVVyU9
         EIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680876366; x=1683468366;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weRVGUeMPOMpIvMiLVH2eyJeEKBQoW1ACkS8HX5VFs8=;
        b=E2s2YK9KplUXbtF0KqjdeoX/t00lt/VEzaaiEueuucfZrWxtwbx32P2fkj4L/CDqPf
         +WVt/E+L1dIv41DUHR1jGuU7DoNi47PM/GgS2B51RdYv6nWJ9DyfF6bej63GDIe9s3+/
         6Mzsmvfhq61LA1zMxLGwckDePQFcbwX/Me3oAyZkPRKSat6i77A7BiKfcZa5NxuYzoZU
         0jtFmlAFusN+hu0VuABEL0JH5rMXuUrHRmfcKJVq5zHjQrOqlYYuBGfyTD1JQThzqHfC
         AKBymqAG2vAWILGJr4HcDdYNgA1t+mRpWJk83AmuSX09gNo/6zkJazRpvmgCWI16Mh84
         swIQ==
X-Gm-Message-State: AAQBX9ew5Expf1fliyTcX7odjNGouYaVXxTuaFy7EoX5/HHTdiSBEyiR
	7D7kweqOFMQQD7xb0zhfuYq6UdqEYpUuTeIktCIX9BoakMnfucHxNNM=
X-Google-Smtp-Source: AKy350bXrIbtUIts0bRlK9bKYNByAdq6jDcnZHY7/v893jsgHyHkEhsGnjPoYhsGwuiA2SOXw5OOMOmw57fBI9DoRbE=
X-Received: by 2002:adf:ffd2:0:b0:2e4:abb1:3e81 with SMTP id
 x18-20020adfffd2000000b002e4abb13e81mr379166wrs.2.1680876366031; Fri, 07 Apr
 2023 07:06:06 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Fri, 7 Apr 2023 10:05:55 -0400
Message-ID: <CAPoiz9xFrqscPE2Nt-qEYTJDmtLJtOBYOww9XHsQokUaHHbSGg@mail.gmail.com>
Subject: meta-arm mickledore release freezing soon
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Apr 2023 14:06:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4564

With the Yocto Project Mickledore release expected soon, meta-arm will
be following suit.

Barring an issue or something on the mailing list that is in the
process of being integrated, we will cut the meta-arm mickledore
release on Friday, 21 April 2022.  To this end, we will be freezing on
Wednesday, 19 April.  So, please push all outstanding commits as soon
as possible.  If you have something coming that you need in the
mickledore release, please let us know.

If there are questions or comments, please feel free to respond to
this thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

