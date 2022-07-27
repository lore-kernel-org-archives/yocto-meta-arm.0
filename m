Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D52C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:54:03 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.25504.1658958839556769656
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Er18CrJs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id m10so180172qvu.4
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H/oU+WZWxM96DWk+8zd/EqekNG6dnGZnIiWztuTgBtA=;
        b=Er18CrJsgpBeYsR3fNPO8ZQ9qZYo6imTv33EFPWvzFzDAz5kluJ6lvg2bDuwRrmFwc
         +xJFpzxQRZHQeP+HV7BT/ZhTzk1yn5awRsAn5gqdxPY/RSpm1wC+wuQnuF7lB1JkeghH
         53oufS7TFhh4BO64Eu+E4hSYh5zHhiyB8zFgt9EmYgQGMWsv/zCjqRGX+WJAHK/V8BPX
         9vMjk8Tj/Nq4TkIChonFtHH5/7I+F+p4AVoKBVhQXCtQJpK5zr5rr+k6VtFukdytSxLr
         GQoqPS4qt0SVrAtvthqpKFXfpNPmO7+fQ6HbYsKPK/qh5rzY+Oj7tt6A7VGlelqYWQ6K
         Wxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H/oU+WZWxM96DWk+8zd/EqekNG6dnGZnIiWztuTgBtA=;
        b=ZlZ46uFsHIHjQQ/AcM7qjqhQokYbTHodTKL1YenTofbwp/ChQVtJPqzBLFc1t9onUQ
         1r5UglE0aFGj7nGFXITYm64jPQPsx6GxtOoJHGjJwzIKQKfv9Psj5M6xS4Wf4X0Bpfxa
         eTsgVRhSiy95DGIAGBcg5Y+IS+DZ7Lek6q544pKu7zMjFmsYGKkS54zKi7FJXuyddEvh
         M0YqUDH8Nw+Mo+fDtapTyEOORuZsq1f+JU9rQvyxIR/cFr0W86MhW9KLccO4k4wxLq61
         NLghBbIqz9wAhb1obWxUQUqTyka3s+cYalUnvCjE8w2yePmjlGV/G/m+dVjNpU6sEOva
         vr3w==
X-Gm-Message-State: AJIora/ldqnh/9IMno/Q14nm26baICF3eTssG71rpmEHLnM0AQi9N/iB
	Nl1EvlRehg51mu1OyCv+l2Ci8A==
X-Google-Smtp-Source: 
 AGRyM1tI7Ky877p4Ljl95Jh0xwwi8KRWnOCDVH2JLPBd7g4kxDYh+dCdHrJMMzoRs+GkvAOzsgg+eQ==
X-Received: by 2002:a05:6214:20a5:b0:474:6683:ed78 with SMTP id
 5-20020a05621420a500b004746683ed78mr9440842qvd.11.1658958838621;
        Wed, 27 Jul 2022 14:53:58 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 u22-20020a05620a431600b006b5a9e53105sm14258846qko.91.2022.07.27.14.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:53:57 -0700 (PDT)
Date: Wed, 27 Jul 2022 17:53:55 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Peter Hoyes <Peter.Hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, diego.sueiro@arm.com
Subject: Re: [PATCH] arm/oeqa: Fix regex warning in linuxboot test case
Message-ID: <YuGz8xzJuRDtPuxm@kudzu.us>
References: <20220726153536.3573383-1-peter.hoyes@arm.com>
 <165886848111.1179859.10226758370769335566.b4-ty@arm.com>
 <bcfedd63-9845-934c-5939-2f2aabcaa933@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcfedd63-9845-934c-5939-2f2aabcaa933@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 21:54:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3607

On Wed, Jul 27, 2022 at 10:29:22AM +0100, Peter Hoyes wrote:
> On 26/07/2022 21:48, Jon Mason wrote:
> > On Tue, 26 Jul 2022 16:35:36 +0100, Peter Hoyes wrote:
> > > The linuxboot test case prints the following in log.do_testimage, only
> > > when executing testimage without a pycache:
> > > 
> > >    linuxboot.py:18: DeprecationWarning: invalid escape sequence \:
> > >      self.target.expect(self.console, "login\:", timeout=10*60)
> > > 
> > > Fix the warning by escaping the ':' character correctly in the pexpect
> > > regex.
> > Applied, thanks!
> > 
> > [1/1] arm/oeqa: Fix regex warning in linuxboot test case
> >        commit: ef879b5fb87910b80ed19e7bf036d3c6b0684f89
> > 
> > Best regards,
> Please can this patch be backported to kirkstone.
> 
Done

