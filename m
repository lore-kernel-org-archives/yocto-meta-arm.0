Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.24450.1590707642459819978
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2020 16:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=FcqginSm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id b11so506638qtt.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 May 2020 16:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RXWDpCgQVqBk7o9eZbDa6ENgutV9a2BpNcN0ao/p6Tg=;
        b=FcqginSmQ8/i+Fg4sng7IivHvEF3x1YdqnC8BJrDhazF2Qlz538rzjUHjA+F+MgZA5
         3fvVXJRd9aJX6g1hth5Cx8KKgfPQUHtJlvyYiEhG7gUSmRVPY1WRe7MG9KFMQIPdiH/7
         mjnDQBJWSTU7x2Kps343yiq4448U++shrE/I4xlutjiwsKYH1UMtR5Fma4aF3sJ7KKmS
         EIoxIon9Ql17GqTEpDbJygzlKNAaQvq6V4PURPMvUr257yPmVPoN9q6PINL1ccni+f/X
         eL+sMpwvtISkRFMMO17e8U+EwsW6b+rv80dLZmmqG3wBM/4ldgRxeHOP1msdprKSX4c2
         aedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RXWDpCgQVqBk7o9eZbDa6ENgutV9a2BpNcN0ao/p6Tg=;
        b=ffQQbpRi4fXpPlQN4Mjq8cscMpy8EEOjwtvLep/sHIsDfaPiB+Tl0x/NWlgrRLn7H+
         f3FTqiNRljnVOry7/s4TYoEpY7W8RWRFEeqMaJrJRz/DTqOyNPNnRR+JbaWcH4wsM18r
         /vIizB/92rEbEeRm99RfSLYtfk+KBSEFvjzsj0NGWlTa7eHADTRIQ8ZrXYz5yVrNIAIU
         T2T8qcjrHMfMsD5a0+lZ+eFHInsmL59b9evwEIlQlM6ph6mVKlSMIrczLLepu1PYLynK
         mPGMsDoitVD7r3d6SDF6if8lvZWJzIxvHOohtvMXnNbtn8k8UCJInluUbWdjxRQEX9TK
         dAHg==
X-Gm-Message-State: AOAM533x515Jn4zVHDdolbl1OZh7ueVtycXY6/XJkCWkTdAuBjdRFkfn
	j8Hmq/+0McTbVqtmJM/ueQ7TnQ==
X-Google-Smtp-Source: ABdhPJz4XzaVnR95Ld4aoyweHq4AaEMY9I+i0C4rgzLZ7GFCT/sWLCvALLPbnxn7veKyopH/9YQUXQ==
X-Received: by 2002:ac8:3f47:: with SMTP id w7mr5907070qtk.11.1590707641572;
        Thu, 28 May 2020 16:14:01 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a664:2e00:a424:8d51:840f:7f5c])
        by smtp.gmail.com with ESMTPSA id p13sm5905251qke.135.2020.05.28.16.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 16:14:01 -0700 (PDT)
Date: Thu, 28 May 2020 19:13:59 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Diego Sueiro <diego.sueiro@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-aarch64-none-elf: Add recipe
Message-ID: <20200528231358.GA11222@kudzu.us>
References: <1589964438-6924-1-git-send-email-denis@denix.org>
 <22524.1590037979741392604@lists.yoctoproject.org>
 <20200522231747.GD17660@denix.org>
 <20200526134018.GA32704@kudzu.us>
 <20200527025934.GJ17660@denix.org>
 <20200528133559.GA25502@kudzu.us>
 <20200528181311.GQ17660@denix.org>
 <20200528204434.GA8305@kudzu.us>
 <20200528211051.GR17660@denix.org>
MIME-Version: 1.0
In-Reply-To: <20200528211051.GR17660@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 05:10:51PM -0400, Denys Dmytriyenko wrote:
> On Thu, May 28, 2020 at 04:44:35PM -0400, Jon Mason wrote:
> > On Thu, May 28, 2020 at 02:13:11PM -0400, Denys Dmytriyenko wrote:
> > > On Thu, May 28, 2020 at 09:36:00AM -0400, Jon Mason wrote:
> > > > On Tue, May 26, 2020 at 10:59:34PM -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, May 26, 2020 at 09:40:18AM -0400, Jon Mason wrote:
> > > > > > On Fri, May 22, 2020 at 07:17:47PM -0400, Denys Dmytriyenko wrote:
> > > > > > > On Wed, May 20, 2020 at 10:12:59PM -0700, Diego Sueiro wrote:
> > > > > > > > On Wed, May 20, 2020 at 09:47 AM, Denys Dmytriyenko wrote:
> > > > > > > > > b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_9.2-2019.12.bb
> > > > > > > > > @@ -0,0 +1,38 @@
> > > > > > > > > +# Copyright (C) 2020 Texas Instruments Inc.
> > > > > > > > > +# Released under the MIT license (see COPYING.MIT for the terms)
> > > > > > > > > +
> > > > > > > > > +SUMMARY = "Baremetal GCC for Aarch64 processors"
> > > > > > > > > +LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
> > > > > > > 
> > > > > > > <snip>
> > > > > > > 
> > > > > > > > I see lots of commonalities (code duplication) with the 
> > > > > > > > gcc-arm-none-eabi_9-2019-q4-major.bb recipe. Isn't now a good opportunity to 
> > > > > > > > have a `.inc` to avoid this?
> > > > > > > 
> > > > > > > Yes, there's lots of duplication in those 2 recipes. Unfortunately, there's 
> > > > > > > copyright in the original one and I cannot touch it w/o a lawyer. That's why 
> > > > > > > I don't like copyrights in recipes (nothing much to copyright there anyway)
> > > > > > 
> > > > > > I'm confused.  You mean the MIT license in
> > > > > > gcc-arm-none-eabi_9-2019-q4-major.bb?  If so, is it not the same as
> > > > > > the license you reference above in your patch?
> > > > > > 
> > > > > > > > The path inside the do_install can be easily controlled by a variable set 
> > > > > > > > from the recipes that are including it.
> > > > > > > 
> > > > > > > Well, those are technical details I can handle quite easily - I've been doing 
> > > > > > > OE for 13+ years. But it is legal issues where I draw the line...
> > > > > > 
> > > > > > Assuming it's the MIT license, and you are unwilling to do it, I can
> > > > > > pull it in and make the common inc file.
> > > > > 
> > > > > I've been discussing this with Joshua offline lately - give me a bit more time 
> > > > > to sort it out, hopefully I can come up with a solution. If not, I'll let you 
> > > > > know. Thanks.
> > > > > 
> > > > > -- 
> > > > > Denys
> > > > 
> > > > 100% untested, but I think the following might work
> > > 
> > > Thanks, Jon. This is a step in the right direction, but I see you define NAME 
> > > variable and a common do_install that uses it, but you didn't remove specific 
> > > do_install versions from the corresponding recipes...
> > 
> > Slop from trying to get the patch out and not committing what I had
> > locally.  I was more showing this to see if the "NAME" way I did it
> > was an acceptable "Yocto" way to resolve the issue (instead of a
> > dirty hack).
> 
> Sounds good. Let me know if you have an updated version to review.

Okay, I'll send out an updated version of the path shortly.

> 
> 
> > > Also, for this commit you'd have to accept my original patch submission to add 
> > > aarch64 version. Or do you plan to squash them?
> > 
> > I'm fine with either way.  It is probably easier to pull in yours
> > as-is and do mine as a follow-on, unless someone has a strong opinion
> > against.
> 
> I think merging mine as-is and then follow-up with unification would be the 
> most appropriate when it comes to copyrights and legal stuff. Sorry it causes 
> extra issues, but I'm just trying to be extra careful around this stuff...

No problem.  Patch merged to master.

Thanks,
Jon


> 
> -- 
> Denys
