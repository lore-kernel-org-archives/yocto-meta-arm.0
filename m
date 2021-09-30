Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955FEC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:15:06 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.13224.1633011305742833248
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 07:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=n/J0hh28;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id e16so5728749qte.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1+IgZD9u1pA2JMZMxkI0bTk7jEyxU5UJsTzBojJBRyQ=;
        b=n/J0hh283Eiag01YisRLMsAoVBr+zpUij3lewEbUQAxor4ebkfss4ceZcmNpRzxPTJ
         wvAHIVVXwoNOQBABPbiLS6h8ftBxmeuk3vEz/HnUXBVPYxG+MtC00kwmQq3jmKTLz8NF
         lvo1F0mwqCelD/nVDpwl2IXhfKayozDb83qn5Gi4tO3xunU90RPkonq5RDfKuiyMjUpH
         bY5ib7T5+2DAMaAFToj9Tnc7ntyukdE3T6IQ+mqWtRHGqEEc5e8j5Ss8wpnNuWSVgraW
         TsNqNoYuPwLyiASTvkMzIZld3wIC8xtnwzScPK/TciIAOb1YMdGGVTzEqybAQtipvQ1r
         hy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1+IgZD9u1pA2JMZMxkI0bTk7jEyxU5UJsTzBojJBRyQ=;
        b=fYuk8NmIaL2cY3ljinAmI5umuy7xkRQ+1q1HORL+uXLk29HHin1IhBZ/PGqjvpPPvy
         HZ6vIb2oKdF2ZWKlkkTJSY55zJYVo9rRSsxi4HRfKTOXlvkHSkB35f83mcqwPCbcJa0+
         mI9WGxkQ4wSQE0Lp2K8DQlEifPsac+a9sapg6jqdgxmmkDVEyltaoLxJtndtyWqhq+BQ
         tDKbJQ/X2eh2vYkvdlBV4yFqWdRvJ3sUJjAijapjke3IVMzF5yPIrcPcJO5Rl8w7omeH
         yJZwQOUYy9l586oMVcIp0jtfoMjUbxT4CKiKawgov3FeQKI4alwRMLKgxevq/4qtCJTq
         9sVA==
X-Gm-Message-State: AOAM532Qo1zRB+w/mlOijO9Dx6RIT4L43tj4chx6BGqZM1+0kXE0uQol
	lu+EFVJN/0LHD8BDLjnvl1w1qe+Rq9VrefUQcXy6Bem8JPt5Bw==
X-Google-Smtp-Source: 
 ABdhPJwqlDX2xxUIAYIpuImyL2K2rLROxv2QBP0NEbs4scJ1vlWSiNji82z5sF4ZYy7Z4mp0x2gUwrdLNaajggzJ490=
X-Received: by 2002:ac8:7ed2:: with SMTP id x18mr6808162qtj.213.1633011304531;
 Thu, 30 Sep 2021 07:15:04 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 30 Sep 2021 10:14:53 -0400
Message-ID: 
 <CAPoiz9wEdT2RgMoAZ5CX4MuBX8Hsh2kx40S85NsSduKd2Xk7YA@mail.gmail.com>
Subject: meta-arm honister release plans
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Sep 2021 14:15:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2240

Yocto Project will be making the Honister release in October, and
meta-arm will be making a release to coincide with it.  To facilitate
this release, we are requesting that:
* All outstanding features be pushed within the next 2 weeks (deadline
14 October 2021)
* All bugs be addressed in the 2 weeks following the feature freeze
(deadline 28 October 2021)

Barring an issue or something on the mailing list that is in the
process of being integrated, we will cut the meta-arm honister release
on 28 April 2021

If there are questions or comments, please feel free to respond to
this thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

