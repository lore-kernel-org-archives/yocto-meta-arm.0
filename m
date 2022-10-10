Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A4EC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 13:52:05 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.6465.1665409916922073355
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=a4X2B6e3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-wr1-f44.google.com with SMTP id bp11so4402193wrb.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Avxk9s563HlVG4Jft2Nv2VkfWIQs3z36l9dT+NgS3M=;
        b=a4X2B6e3DjtOKLRNVjzOLhlHkQ9LmchX6jgzN/YJ1RTI+0rs3CF17SVbmXXlxRUjwM
         lLFIxUaND1VAG5KDAkXVmcz7LYFfcw0NmG43Jyy2zFLce/Lw/dERijnWx1TEDgrF5jl9
         9vJhnw2iZf9MQB6iFnzrbUNCdSOUGP0hwKI/n227Tqi3znPttFlwZHQnq2blLP4k17Wa
         pwjDUblRhW5fo/Q4vUkSvxCwx3YIKD/0PAdEMvE5SGuUKQjdA1VU83QdSaf4FjX9ea4P
         fZ6r5lSC4udF/6aveCN+XR3SlsLnYA1DiUSXKF+/xbM/6q5kjIo8wf3uHtCPbMUchllP
         S6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Avxk9s563HlVG4Jft2Nv2VkfWIQs3z36l9dT+NgS3M=;
        b=zIQ179REt6kzIpDE39F491CqKHsx9WKaFIdiIK69k6q5RtedR+ze8H/AqGsp9qWYbT
         KRgt3iCJ16M5Iv62WxU+5Ov/7w/CJ2sahyQQSEY8VdwYP6DaI3BjsQ7lcFLRtWiFjLpS
         BDXp05iE2zhEgSx3bs15Hn/zHpNkLLZn7c2ZwyRfV9xiUp4oj52LNIhwITq8npNvbugT
         O3aBGvuDzGepUCrLF62K2VwGHd7ZNwepOwfRGece11q+3TSdbFTLRcWWE2IsijFwF4By
         fUTtr9N5Aq5Q4WNqGnIdpSxRzEkKN/mF3Kp8lkPMwKl9a1z5RVUBI8a9C1q6LOfBlJg8
         HMQQ==
X-Gm-Message-State: ACrzQf2Fj4eFUJjksYthGPoOjK0pDVsEBMmptyT922g+0a6+M0u+co5H
	bK5TTWgf4BYWyJUe4xDp7uqhFMZXp0VcTU6usy3tw6oEmHnvEA==
X-Google-Smtp-Source: 
 AMsMyM6q4sAyzqVyCNbtY+29Hx8Yz64TzgBXwcLYbBly+Cu2N/H5C+zRGxMRh8YzD23D1aYEEo9Bn8R4XQBBY1Sl2Ck=
X-Received: by 2002:adf:edd1:0:b0:22e:5257:a19e with SMTP id
 v17-20020adfedd1000000b0022e5257a19emr11122806wro.180.1665409914827; Mon, 10
 Oct 2022 06:51:54 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 10 Oct 2022 09:51:43 -0400
Message-ID: 
 <CAPoiz9wOmYXaBsL=xWj61a76qDQw_zUZb9SdN+TCrZe3ZMj25w@mail.gmail.com>
Subject: meta-arm langdale release freezing soon
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 10 Oct 2022 13:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3945

With the Yocto Project Langdale release expected this week, meta-arm
will be following suit.

Barring an issue or something on the mailing list that is in the
process of being integrated, we will cut the meta-arm langdale release
on this Friday, 14 October 2022.  To this end, we will be freezing on
Wednesday.  So, please push all outstanding commits as soon as
possible.  If you have something coming that you need in the langdale
release, please let us know.

If there are questions or comments, please feel free to respond to
this thread on the mailing list or email me and/or Ross directly.

Thanks,
Jon

