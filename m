Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.4179.1580181572849955212
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 19:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=CT+WrYLf;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.50, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f50.google.com with SMTP id n11so12605580iom.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 27 Jan 2020 19:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=O5Uwq0M/2EUki0ybMPJfAIT5+y+Sfy4jp2oitrCPXxM=;
        b=CT+WrYLfCWdsbeOQm0OQuTBEBkuRRoOLNyrBgPhNI0GYMmBmjPEV8y5Bj5mpp1EMbZ
         OL/OeuXLibp/WBlsSVOhVd/tyi0IoJQBAujzMHOyJxWVf3KB7OWmuTyKxzlbtWxi7BmZ
         T2fMkQVRhMPOHubTDHe2MPSHkQ7vz5wXPTq5jCCITCFTScN/D/f3LkB3J6Tiu2pgKLy7
         MeGPeIMzUW30pTVOjp9L4xn9e8MnR64w78M94+PWGYYB8PZDaOotjGVXHZqoTL660mu1
         IafUxZmk/V9Vej0h4ZnLsjDNNOwrX8ZTa1O/77bNsS92FKizOli0wMlUOm3UQE6lx6Ws
         omuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=O5Uwq0M/2EUki0ybMPJfAIT5+y+Sfy4jp2oitrCPXxM=;
        b=OLFVUXFJknaFtf0i2KVaHHDRjc6Cgzl19s48Xg0mZfFAp4pMGa7MbsVNlrTsBVc06D
         OR8DZwK9qXuxFdseNPr9q7kCIEzOHp5DE6xAoGn7Xar+pJCK3jElQqHb0NcYX+m9VN2d
         Y3gFTU0gpWCzJyr7vaJ1s4nTECSI4/rCS3tXIIElVoCOz7ePESI+uTuWCd1a/Cl2kh9T
         3ynztPzKaoKGaGoylU8TGoA3zShQ2j6BH46NRoaZkckxk8KWAVOPJZkaSllUn9nSTU21
         znF39F3F+kb5g+ahHVTySa+5kHsHngv7osHkmgwNcLBsRzT1fVBv9D5hZ/hmmqj666Nw
         /nmQ==
X-Gm-Message-State: APjAAAWbcV5YnzazBkh7kPnc+Nrrct4ymOyNrAQQYsnnA6dTZJBZErzK
	6Nn9H6ZB+NFyPY8KAYCfB2SpYojjLmaxKy6Tp6KqUHLCxFw=
X-Google-Smtp-Source: APXvYqzhoc7WA8ro/k99ZCDhTG7kntfN1JPhxJRCnR5lxx9Kp2MJzOV7esVID+PE1rWOuevs4tl+FRSaSUVqsyclsaI=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr15672507iog.42.1580181571988;
 Mon, 27 Jan 2020 19:19:31 -0800 (PST)
MIME-Version: 1.0
References: <CAFA6WYMS8Arp=nGhnf_4feXBfx7n9a-q6Tc4AXbQSafc+d0+oQ@mail.gmail.com>
 <12230.1579827059785197376@lists.yoctoproject.org> <CAFA6WYMXaNgRgAJ_mC-TSYqgRBvZkVD4Le=qu-p4s-wZb9h25Q@mail.gmail.com>
 <CAPoiz9zfipHK4pf6ECt-f5Gq6w_cKwh=DdsTdHnE+ENh--7vCw@mail.gmail.com> <20200128004726.GJ4735@denix.org>
In-Reply-To: <20200128004726.GJ4735@denix.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 27 Jan 2020 22:19:21 -0500
Message-ID: <CAPoiz9zOt+VGQTJUezWaZGk2505F8VFTvyiNF6xxWNo2ex_n_w@mail.gmail.com>
Subject: Re: [meta-arm] Proposal to import ARM GCC toolchain recipes into meta-arm
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 7:47 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Jan 24, 2020 at 04:12:39PM -0500, Jon Mason wrote:
> > On Fri, Jan 24, 2020 at 12:18 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > On Fri, 24 Jan 2020 at 06:21, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >
> > > > As one of the original developers of the whole "external-toolchain" support[1] and still being an active contributor[2], spanning through CodeSourcery->Linaro->Arm recipes, I would certainly welcome this move!
> > >
> > > Thanks Denys for your contribution.
> > >
> > > >
> > > > BTW, what is the branching strategy for this layer - will there be release branches, like thud, zeus, etc.?
> > >
> > > I would expect meta-arm tree to also support thud, warrior and zeus
> > > branches since external-arm-toolchain support all these OE release
> > > branches.
> >
> > Our plan was only to support zeus and releases going forward.  This
> > was to limit the releases we need to test on.  If there is a desire
> > for more, then we can accommodate.
> >
> > And to answer Denys' original question, yes we will create branches
> > for each one.  Given that we are currently only supporting zeus, this
> > is why we only have master now.  If there is a request for me (per
> > above), then we will branch as needed.
>
> Jon,
>
> Thank you for the details. One more question - do Arm-originated patches go
> through the same public list or are they reviewed internally before merging?
> Thanks!


The internal process should be that the patch is reviewed internally
via gerrit, then pushed externally to meta-arm mailing list for
review, then pushed to the external git repo (assuming no problems
found at each step).  Since the git tree was not public until
recently, I've been lax about enforcing this.  However, I will make
sure that this is enforced going forward.

Thanks,
Jon


>
> --
> Denys
>
>
> > > > [1] https://git.openembedded.org/openembedded/log/recipes/meta/external-toolchain-csl.bb
> > > > [2] https://git.linaro.org/openembedded/meta-linaro.git/log/meta-linaro-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
> > > >
> > > > --
> > > > Denys
> > > >
> > > >
> > > > On Thu, Jan 23, 2020 at 02:39 AM, Sumit Garg wrote:
> > > >
> > > > Hi Jon and all,
> > > >
> > > > As you may be aware that Linaro used to maintain meta-linaro-toolchain
> > > > layer [1] in meta-linaro tree for GCC tool-set releases from Linaro
> > > > till GCC 7.
> > > >
> > > > And since GCC 8, the tool-set release and maintenance work was
> > > > transferred to ARM. But meta-linaro-toolchain layer continued support
> > > > for ARM GCC tool-set releases as well.
> > > >
> > > > In future, I think meta-arm tree [2] shall be an appropriate place to
> > > > host ARM GCC toolchain recipes as an additional meta-arm-toolchain
> > > > layer. Also, with the latest integration [3] for ARM GCC 9.2 toolchain
> > > > in meta-linaro, recipes are well tested and seems to be stable. So I
> > > > would like to propose import of ARM GCC toolchain recipes into
> > > > meta-arm.
> > > >
> > > > I am looking forward to any comments or suggestions regarding this proposal.
> > > >
> > > > [1] https://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro-toolchain
> > > > [2] https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
> > > > [3] https://lists.yoctoproject.org/g/yocto/message/48094
> > > >
> > > > Regards,
> > > > Sumit
> > > >
> > > >
> > >
>
> >
>
> 
