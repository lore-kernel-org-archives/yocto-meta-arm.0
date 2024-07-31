Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4BDC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:57:28 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.42318.1722430642126725471
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Jul 2024 05:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eECYutZs;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d3959ad5so82467985a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1722430641; x=1723035441; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oO7SU6QO5HffNd08HXx6FrQcrixf6VKB+RpxHeyX3zY=;
        b=eECYutZsHou8Wm77uT5Ej1ZXfS0qD3UCtNBsvA+S96TcBlKRjvZlkhS6dBw7vBwpIZ
         +NEP00/FmjXcKXoob8hRfBYEeXry7mNEABeic3LyQRof/euNymfP/3M5sbRwwXoOUnux
         TZ3rNQaZ2CFPkqatjqVa3qKLQNf6FLfA/iKZ6XRjEGXqv5FafcfEZi+tlgPWckILDBID
         Iv9f2Ml4o42HppS/XUNsPz1UiDJxfHatIqK7dsScek2n01Q/34nebxj4BYffSNX38GNv
         JWaVHvIcK4cWKg41dS4AAxySpKCKmI2oP+k+wHi1LvW+EtOL68ux48YM3sa9mkdYBG7O
         jCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722430641; x=1723035441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oO7SU6QO5HffNd08HXx6FrQcrixf6VKB+RpxHeyX3zY=;
        b=I/8hOzXzwbiCfKD8oQUW7yv5NFyA8yHdTOjFd+w0xE6ASMDWzPie5kTSz981hOxAsq
         HNlSO7SQOYHz46/pfC0QRSOdJLBLJUtat/KHGr1/e/sX488GKTFWRgxP5RcpFerFk8VF
         YyckmdgAhvgIzlhkSV8YxowPofPfiB7omlzu9AsIxKJ5UXg8YyaorjBmkge2MOzxqAND
         eZrIkaI6WViBaWzFfq+s/aEMeE9YZqvvX2H+PzGN4TQesUMQin1Ojoi0sm9HD1UJw118
         wM8Hnm6v4gWLZ20JCk3sj6UuiGjgXBMenwC6oEhATm15myN6TW6xjxU5zh3kD/5/xkMA
         EE5Q==
X-Gm-Message-State: AOJu0YzQFYqN4Cel6Kk2BIgFjYoF8k0NdLDq/tkkdRTzKXu+PT6b0dcm
	vPFccjU5Nt6EdHEgWjSAkS2KxrNBT4DWt2OMAve8iIYrsqQEXOIsqE/TLd/nBQ==
X-Google-Smtp-Source: AGHT+IE7v047IOLg5yUZc1gphvdjGQ551VxgFrcZuXCIJo3tA4BO4EVioiIKTd4ygyeG6P4IWRV97w==
X-Received: by 2002:a05:620a:31a3:b0:79f:f6:1a78 with SMTP id af79cd13be357-7a200cd54d8mr946583485a.15.1722430640963;
        Wed, 31 Jul 2024 05:57:20 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe8201925sm57901561cf.63.2024.07.31.05.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:57:20 -0700 (PDT)
Date: Wed, 31 Jul 2024 08:57:19 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/4] optee-os: asm debug prefix fixes
Message-ID: <Zqo0r0wEzuD2LpQj@kudzu.us>
References: <20240718134152.38721-1-mikko.rapeli@linaro.org>
 <ZqizD72goWGzQjGw@nuoska>
 <ZqmrjL-EKud5PJSn@kudzu.us>
 <ZqnbTSo2JxV2m6wr@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqnbTSo2JxV2m6wr@nuoska>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 31 Jul 2024 12:57:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5935

On Wed, Jul 31, 2024 at 09:35:57AM +0300, Mikko Rapeli wrote:
> Hi,
> 
> On Tue, Jul 30, 2024 at 11:12:12PM -0400, Jon Mason wrote:
> > On Tue, Jul 30, 2024 at 12:31:59PM +0300, Mikko Rapeli wrote:
> > > Hi,
> > > 
> > > Is there something in these patches that is not ok for merging?
> > 
> > Sorry for the delay.
> > 
> > Something in CI was breaking and I was trying to isolate it to the
> > individual patches, but the CI I'm running that is publicly available
> > has been having issues (which I think are now resolved) and the
> > internal one has been bogged down with a large number of reviews.
> > 
> > v2 that you just sent is now in master-next and hopefully will be
> > happy when I get up tomorrow morning.
> 
> Ok then these optee changes are likely not causing issues, good to know.
> 
> I'll wait for the master branch update, can't see master-next changes.

I only do master-next (and actually all of the '-next' branches) on my
personal gitlab.  I do this because I'm constantly applying and
removing patches from it.  You can see it at
https://gitlab.com/jonmason00/meta-arm/-/pipelines

I do this in an attempt to have our CI being public and to make it
easier for people to see when there are issues.

Thanks,
Jon

> 
> Cheers,
> 
> -Mikko
> 

