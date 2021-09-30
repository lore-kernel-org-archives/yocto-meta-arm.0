Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00898C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 16:08:44 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.14855.1633018123520966826
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 09:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=dXUvWfTQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 11so3881427qvd.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNBivHbcIEP3t1EPb6AWZFSA+G2Et9V6gRf+H1Ed4IU=;
        b=dXUvWfTQWmRrKqPUgH7yJes8xqTY25kseZwflP1DD4hWs75N4RtMu2bQOwB8RGrb2G
         DvRaep+kDgzEFMSrKWPKto1zwIMPtEyWcNUSFw5WjgUB1u17969R4flsf/Bs+AhzCeBF
         0HAA8CvZm1Q45b3tZ1VuV6akSYZdEvE8nCYH0WqHEvxVcP9E+7M8pR96zPqmon2y5NLX
         UKn02PmIzIkOic93cOA3gURXpUG5XrNygkCO1QKwa2sOCz+qhkKiJvSAZTB2O+pAaqrs
         oVVSL/hgk9JGLv+b/XL+4QEw9IMp27gN1MgcOmhgTvyVEsdueJ0mVU4TcZfaNrhXnsZr
         t+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNBivHbcIEP3t1EPb6AWZFSA+G2Et9V6gRf+H1Ed4IU=;
        b=OZfAa2XmW2mZD8j7qc7bFnihqvqOYnu5wZJ1I5go0S5GEnk+73YUURXf0bhZa03HDO
         DBX862FClATwdZtfIJraAcJ6QkzfdHGAqHlUikVQlA5WwwgnQCmuLSPHjVPUzYmxXAUX
         gkHtpClcy5ldZtuYYr3HPX53BA9EM6+kqacIVUeo06BsVg7SgWLvJ8MrBE4eQS/rfJL+
         s5B6RhUGoqA/i61wKYO9MYnTpFCGy7iEly8evuTNoiu77RQZ4EdbbgoN4dCgh8yQHHqc
         sDbE148QH0orJcGngrVs745HK6aWU7NEVHvKlDrI1/MJMcR3b6fwb7Sl7bXoZEez259E
         lhAQ==
X-Gm-Message-State: AOAM531zNRNmNWLsMEmuQBZ8EQbJEDsla19fHV3mtUkG4AAmWYlDZgO/
	NkxCXvm50aGpOcob1lvnbsCQ0tppxGcVyUFtLkdB1Q==
X-Google-Smtp-Source: 
 ABdhPJxRMc0/BZuinWwnf2uEMXQchA3ZAu+cMcbVq/ishHGJgAOPL7331mzxOsbmpYxdLJYYAhJk96aoOKmBrvpQOiQ=
X-Received: by 2002:a05:6214:4008:: with SMTP id
 kd8mr4534055qvb.15.1633018122640;
 Thu, 30 Sep 2021 09:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <16A99F218EB3CA6D.3910@lists.yoctoproject.org>
In-Reply-To: <16A99F218EB3CA6D.3910@lists.yoctoproject.org>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 30 Sep 2021 12:08:31 -0400
Message-ID: 
 <CAPoiz9xrh_fvZY9EgxN19kKN_S9aALRfVt=FFuX1b9iuVnHW_w@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm honister release plans
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 30 Sep 2021 16:08:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2241

On Thu, Sep 30, 2021 at 10:15 AM Jon Mason via lists.yoctoproject.org
<jdmason=kudzu.us@lists.yoctoproject.org> wrote:
>
> Yocto Project will be making the Honister release in October, and
> meta-arm will be making a release to coincide with it.  To facilitate
> this release, we are requesting that:
> * All outstanding features be pushed within the next 2 weeks (deadline
> 14 October 2021)
> * All bugs be addressed in the 2 weeks following the feature freeze
> (deadline 28 October 2021)
>
> Barring an issue or something on the mailing list that is in the
> process of being integrated, we will cut the meta-arm honister release
> on 28 April 2021

This should say 28 October, to match the line above

>
> If there are questions or comments, please feel free to respond to
> this thread on the mailing list or email me and/or Ross directly.
>
> Thanks,
> Jon
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2240): https://lists.yoctoproject.org/g/meta-arm/message/2240
> Mute This Topic: https://lists.yoctoproject.org/mt/85974627/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

