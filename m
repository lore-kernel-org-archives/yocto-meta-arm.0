Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.3276.1617130373250550162
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 11:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=blN8LJ5O;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id y12so5565195qtx.11
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Mar 2021 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gErcGoJbb2KeQY+2EpERry5cL9S8dakprU2ZS/Adr0U=;
        b=blN8LJ5O88WmmgDDi/sM+FxuIKWUMFaR7QJ7Q9xKDYirGExx5OvCmRMxmC0lqXLGIt
         XL7SYuLv5gDCfNUfjnScWhLSne/pTyWI2vP650P+mkYQE/Y4FaBTBhBgkTMCvL5jguLb
         dgevvOZk8+iVoztTFgHIoyUZMNqdZMU+g/xtz/WydHLhEwDN24Iu+c8DInE4Tf/VUquB
         APYbILqHbkSBv/8O3x8hYRWowgS0UHZw/ewXklBH9goiv+Iyzg+8faZtpaBY9GBDnUeT
         8ZtrlFul74FIH5DM4V+QpSzP5cbKURUCZlRubCuyhdIcLrQslzQ9QVZISzOQ7M/iumKc
         xqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gErcGoJbb2KeQY+2EpERry5cL9S8dakprU2ZS/Adr0U=;
        b=oPBrQX9SBXJO6LsKze6PJBif5/4aHk3t8V+Qqvbm6A27y47lC++xmdawJq+aykIfvh
         A17pvZagYhmRSIm0oAQnlNc5qmyNuqR5ng9x4+J3RHWea+aPhxa5Io2B9A4JmZigksyq
         xIj5MiHOVQ5zUqpPBaqCwGIdyn4yc99gqZUT/lcTbnqwyGSulMPwbCmtbCZRmvOBTBaM
         HGaWEbf/wlXXVJQpQwDMemHE9Ty9KlwIzUsi6bJBjX42cpGZJV8oW8ArSOb2KO68xpsA
         S1QZnjuvYBdrj90A/RJoog94jZsdy9sGMq59H6Gh4PFGchVrxFvch14ZclbOe2MCroG+
         Xzqg==
X-Gm-Message-State: AOAM531BIIHWBpQ18/emdW1UGo4TuQBk1v4C2d0cqLcmoAaIYYwXTQP5
	Xzu0YZ0aoIWm5uYqGUFzCwt9qQ==
X-Google-Smtp-Source: ABdhPJyXQ3mJufZVSAck2/mSBh4fBZW/0oj/MuPILMq4IzClcEWjwypIxAsfXQNO1egh5hBRO+CHFg==
X-Received: by 2002:ac8:7611:: with SMTP id t17mr27963590qtq.361.1617130372374;
        Tue, 30 Mar 2021 11:52:52 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:4ba:158e:74b5:f678])
        by smtp.gmail.com with ESMTPSA id i25sm15995719qka.38.2021.03.30.11.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:52:52 -0700 (PDT)
Date: Tue, 30 Mar 2021 14:52:50 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jack Davison <jack.davison@arm.com>, meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm: Enable ptest for optee xtest
Message-ID: <20210330185250.GA9624@kudzu.us>
References: <20210330130215.40423-1-jack.davison@arm.com>
 <20210330162718.GA23013@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210330162718.GA23013@denix.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 30, 2021 at 12:27:18PM -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 30, 2021 at 02:02:15PM +0100, Jack Davison wrote:
> > Provides a run-ptest script for running xtest under ptest-runner. This
> > script parses the output of xtest and converts it to Automake's test
> > format.
> 
> I think I see this same patch for the third time on the list - is it v3 or a 
> re-send?

Same patch, but Outlook was corrupting the first two.  He used
something else the third time and it applied cleanly.  He knows what
he did wrong and won't do it again.

Thanks,
Jon

> 
> 
> > Change-Id: I7c981422034b39701ddd74e176f2f5134ae607e6
> > Signed-off-by: Jack Davison <jack.davison@arm.com>
> > ---
> >  .../recipes-security/optee/optee-test.inc     |  3 +-
> >  .../optee/optee-test/run-ptest                | 52 +++++++++++++++++++
> >  2 files changed, 54 insertions(+), 1 deletion(-)
> >  create mode 100755 meta-arm/recipes-security/optee/optee-test/run-ptest
> > 
> > diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/recipes-security/optee/optee-test.inc
> > index 969d5e2..877bdeb 100644
> > --- a/meta-arm/recipes-security/optee/optee-test.inc
> > +++ b/meta-arm/recipes-security/optee/optee-test.inc
> > @@ -5,7 +5,7 @@ HOMEPAGE = "https://www.op-tee.org/"
> >  LICENSE = "BSD & GPLv2"
> >  LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
> >  
> > -inherit python3native
> > +inherit python3native ptest
> >  require optee.inc
> >  
> >  # Linking fails on musl due to C++/threads
> > @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/OP-TEE/optee_test.git \
> >             file://0001-host-xtest-Adjust-order-of-including-compiler.h.patch \
> >             file://0002-make-remove-Wno-unsafe-loop-for-clang.patch \ 
> >             file://0003-make-remove-Wmissing-noreturn-for-clang.patch \
> > +           file://run-ptest \
> >            "
> >  
> >  S = "${WORKDIR}/git"
> > diff --git a/meta-arm/recipes-security/optee/optee-test/run-ptest b/meta-arm/recipes-security/optee/optee-test/run-ptest
> > new file mode 100755
> > index 0000000..ba88c14
> > --- /dev/null
> > +++ b/meta-arm/recipes-security/optee/optee-test/run-ptest
> > @@ -0,0 +1,52 @@
> > +#!/bin/sh
> > +xtest | awk '
> > +
> > +    # Escapes the special characters in a string so that, when
> > +    # included in a regex, it represents a literal match
> > +    function regx_escape_literal(str,    ret) {
> > +        ret = str
> > +        gsub(/[\[\]\^\$\.\*\?\+\{\}\\\(\)\|]/ , "\\\\&", str)
> > +        return str
> > +    }
> > +
> > +    # Returns the simple test formatted name
> > +    function name(n,    ret) {
> > +        ret = n
> > +        gsub(/\./, " ", ret)
> > +        return ret
> > +    }
> > +
> > +    # Returns the simple test formatted result
> > +    function result(res) {
> > +        if(res ~ /OK/) {
> > +            return "PASS"
> > +        } else if(res ~ /FAILED/) {
> > +            return "FAIL"
> > +        }
> > +    }
> > +
> > +    function parse(name, description,     has_subtests, result_line) {
> > +        has_subtests = 0
> > +
> > +        # Consume every line up to the result line
> > +        result_line = "  " regx_escape_literal(name) " (OK|FAILED)"
> > +        do {
> > +            getline
> > +
> > +            # If this is a subtest (denoted by an "o" bullet) then subparse
> > +            if($0 ~ /^o /) {
> > +                parse($2, description " : " substr($0, index($0, $3)))
> > +                has_subtests = 1
> > +            }
> > +        } while ($0 !~ result_line)
> > +
> > +        # Only print the results for the deepest nested subtests
> > +        if(!has_subtests) {
> > +            print result($2) ": " name(name) " - " description
> > +        }
> > +    }
> > +
> > +    # Start parsing at the beginning of every test (denoted by a "*" bullet)
> > +    /^\* / { parse($2, substr($0, index($0, $3))) }
> > +
> > +'
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

> 
> 
> 

