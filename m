Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web12.7416.1591709984973817151
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Jun 2020 06:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=wErxNdAI;
 spf=pass (domain: linaro.org, ip: 209.85.219.179, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f179.google.com with SMTP id y13so11142889ybj.10
        for <meta-arm@lists.yoctoproject.org>; Tue, 09 Jun 2020 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7c+L3aiIuo/YefqKl5gxM/SgpCsEcCqwxRA/aALzHk8=;
        b=wErxNdAIx70YD1duDDdMZoaD4LfUhnGS16fPrPDV7oDG69Alm4Bxbsi0Cb4sjhX4LI
         FbHgJ/wzEfdDOZPoUEnwTIJKxMJ/aaGru6MGVG6IDtHUcNJM+vy2OOeNMYzpJJRLYy5E
         weDhoBPan7uzQLAniO21l4WERW3odG55w7mD06J79zzI1Wt4dGcTGuRdvR+LeX4uIbRT
         bL4ylXMzkZXpGEg3YGG1ufn4g2Xuve1KUH+MzpF6PjwdZ5PRbKE6bOZ1nWNsB3ND6zwg
         b5aJuzwSSQzpqC5cqOMIfG6aThUsUJKXzppMoSoxQC/NfgE6PR6bdN2B4tlz9QptyT61
         kBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7c+L3aiIuo/YefqKl5gxM/SgpCsEcCqwxRA/aALzHk8=;
        b=ZkW0Mrpd5GtjSMT9dZAlLcCe2XeHeDa3ulS2LPMngsyf0PlzatO2ymbIUyOzxQcpfT
         3ou+gCfuUjbgHOV9khXPBGtHjbP5ucTj+Cjw3C7SIM+2T4nWFtVcnE2/tu8NMBmliMRJ
         Ggd76UPu6GDE52B1i4HzlKG1qizcNM2f4OtBQKjkG4GP3VUDI07E670Wzk01XvqOZhIp
         I9QDGqng1jCY8qrIXSJLp3zg1HUZcHreGVqYg1EZB+97IvMhAX8377oD+nwZugQ3ItZV
         vBwHOyf73Rf71fexlnXUUHFfHwrw6heAN2KmBDU5BGs6l9FFaioMAGXpM4HTf5H/A2ON
         oAiw==
X-Gm-Message-State: AOAM532Kl7NS+H+KeXt7HOPWUrj2BOdbFhUcFEQCtRrovOT/2JAIlYnu
	kxs0Qan8svNu29AcdMSVadiuxcULcEISP5r7QVhqsQ==
X-Google-Smtp-Source: ABdhPJzP6fkxOin55hFjcwkcheT7y42jBjmXIVaf+ZfPCqTVBaQEaVYYacufnmcGFiM4+J3hwzj/Qs1CgV4PInXxcSg=
X-Received: by 2002:a25:b442:: with SMTP id c2mr6908745ybg.273.1591709983934;
 Tue, 09 Jun 2020 06:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <e1b8af76-856d-0202-da80-5bf464f61fdb@arm.com> <CAP71WjxcnNdvXx1BCDLC5nT2zFVrrXYB_9vBKpmWkQ9L0eGPmg@mail.gmail.com>
 <20200609131535.GA28661@kudzu.us>
In-Reply-To: <20200609131535.GA28661@kudzu.us>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Tue, 9 Jun 2020 15:39:33 +0200
Message-ID: <CAP71WjwvWoY2y7Ev6f_52sfUrH8D6mJAWP_HSu+C==rHw4VHoQ@mail.gmail.com>
Subject: Re: [meta-arm] Proposal for the branching policy of meta-arm
To: Jon Mason <jdmason@kudzu.us>
Cc: Jon Mason <jon.mason@arm.com>, meta-arm@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: multipart/alternative; boundary="0000000000002da30d05a7a6dc23"

--0000000000002da30d05a7a6dc23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2020 at 3:15 PM Jon Mason <jdmason@kudzu.us> wrote:

> On Tue, Jun 09, 2020 at 10:52:02AM +0200, Nicolas Dechesne wrote:
> > On Fri, Jun 5, 2020 at 8:38 PM Jon Mason <jon.mason@arm.com> wrote:
> >
> > > Problem
> > >
> > > The Yocto Project releases twice a year (April and October): "stable=
"
> > > releases are made every six months and have a lifetime of seven mont=
hs
> > > to allow for migration, while "long term support" (LTS) releases are
> > > picked every two years starting from Dunfell in April 2020. The
> standard
> > > practice for all Yocto Compatible layers is to create a "named" bran=
ch
> > > consistent with the code name of that release.   For example, the
> > > =E2=80=9Cdunfell=E2=80=9D release of Yocto will have a branch named =
=
=E2=80=9Cdunfell=E2=80=9D in the
> > > official git repository, and layers compatible with dunfell will hav=
e a
> > > branch named =E2=80=9Cdunfell=E2=80=9D.  Thus, a customer can easily=
 organise a
> > > collection of appropriate layers to make a product.
> > >
> > > In Yocto, these named branches are =E2=80=9Cstable=E2=80=9D, and onl=
y take bug fixes or
> > > security-critical upgrades.  Active development occurs on the master
> > > branch.  However, this methodology can be problematic if mimicked wi=
th
> > > the compatible layers.  Companies or open source projects may not wi=
sh
> > > to release a snapshot of the relevant =E2=80=9Cmaster=E2=80=9D branc=
hes under active
> > > development, due to the amount of testing, fixing, and hardening
> > > necessary to make a product from a non-stable release.  Also, change=
s
> to
> > > keep the master branch of a layer working with the upstream master
> > > branch of Yocto may result in that branch no longer being compatible
> > > with named branches (e.g., it might not be possible to mix and match
> > > master and dunfell).  So, a decision must be made on the branching
> > > policy of meta-arm.
> > >
> > >
> > > Proposal
> > >
> > > There are many different ways to resolve this issue.  After some
> > > discussion, the best solution for us is to allow new features and
> > > hardware enablement to be included in named branches (not just bug
> > > fixes).  This will allow for a more stable software platform for
> > > software to be developed, tested, and released.  Also, the single
> branch
> > > allows for focused testing (limiting the amount of resources needed =
for
> > > CI/CD), lessens/eliminates code diverging on various branches, and
> > > lessens confusion on which branch to use. The risk of making this
> choice
> > > is a potentially non-stable branch which will require more frequent
> > > testing to lessen the risk, and not following the =E2=80=9Cstable=E2=
=
=80=9D methodology
> > > of the core Yocto layers (though it is not uncommon for BSP layers t=
o
> > > behave as we are recommending).
> > >
> >
> > thanks for the clarifications. I believe it makes sense, and I agree t=
hat
> > BSP layers tend to follow a similar process (even though it's not alwa=
ys
> > documented).
> >
> >
> > >
> > > Process
> > >
> > > The process for patches intended on being integrated into only the
> > > master branch is the normal process of pushing to meta-arm mailing l=
ist
> > > for community review, approval and integration into upstream meta-ar=
m
> > > master branch.  For patches intended on being included in a named
> branch
> > > are also the normal internal process of pushing to mailing list for
> > > community review, approval and integration into meta-arm named branc=
h.
> > > However, any patches intended on being included on a named branch mu=
st
> > > also be sent for inclusion in the master branch in a timely fashion =
(no
> > > more than 1 week after inclusion into the named branch).
> > >
> > >
> > > Branching strategy
> > >
> > > Named branches for meta-arm will be released as close as possible to
> the
> > > release of the YP LTS release.  Meta-arm named branches will be crea=
ted
> > > from the meta-arm master branch.
> > >
> >
> > Why only LTS releases? Are you not planning to have named branches for
> > stable (e.g. non LTS) releases as well?
> >
> >
> > >
> > > To minimize the additional work of maintaining multiple branches it =
is
> > > assumed that there will only be two active branches at any given tim=
e:
> > > master and the most recent Long Term Stable (LTS) as the named branc=
h.
> > > All previous named will be EOLed when a new LTS has been released.
>  Any
> > > branches that are EOLed will still exist in the meta-arm, but patche=
s
> > > will not be accepted.
> > >
> >
> > I believe users will need a branch for non LTS stable releases as well=
.
> It
> > might not be an 'active' product/development branch for you of course,
> but
> > it should exist and be opened to accept community patches at least. Wi=
th
> > the new LTS process we now expect 3 types of OE/YP users:
> > 1. active developers on master
> > 2. stable users on current stable, who can switch every 6 month
> > 3. LTS users
>
>
> This is more of setting internal expectations on what they can submit
> things to.  My major concern is the overhead of maintaining multiple
> branches, specifically testing.  I would be happy to cut a release every
> cycle, and, based on master CI, it should be stable.  Then just take
> bug fixes for these branches.  Would this be sufficient?
>

I think so. The key thing here is to have a branch publicly available and
accepting community patches that might come.


>
> Thanks,
> Jon
>
>
> >
> >
> > >
> > >
> > > Branch transitions
> > >
> > > When an upcoming YP LTS is approaching release, meta-arm will attemp=
t
> to
> > > stabilize master so that the releases can coincide.
> > >
> > > T-6 weeks - Email is sent to meta-arm mailing list notifying of
> upcoming
> > > code freeze of features to meta-arm
> > >
> > > T-4 weeks - Code freeze to meta-arm.  Only bug fixes are taken at th=
is
> > > point.
> > >
> > > T-0 - All bugs are fixed and layer is stable, new named branch is
> > > created based on master and no new patches accepted to any previous
> > > named branches.  Master branch will start accepting patches again.
> > >
> > >
> > >
>
> >=20
>
>

--0000000000002da30d05a7a6dc23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, 2020 at 3:15 PM Jon Ma=
son &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Jun 09,=
 2020 at 10:52:02AM +0200, Nicolas Dechesne wrote:<br>
&gt; On Fri, Jun 5, 2020 at 8:38 PM Jon Mason &lt;<a href=3D"mailto:jon.ma=
son@arm.com" target=3D"_blank">jon.mason@arm.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Problem<br>
&gt; &gt;<br>
&gt; &gt; The Yocto Project releases twice a year (April and October): &qu=
ot;stable&quot;<br>
&gt; &gt; releases are made every six months and have a lifetime of seven =
months<br>
&gt; &gt; to allow for migration, while &quot;long term support&quot; (LTS=
) releases are<br>
&gt; &gt; picked every two years starting from Dunfell in April 2020. The =
standard<br>
&gt; &gt; practice for all Yocto Compatible layers is to create a &quot;na=
med&quot; branch<br>
&gt; &gt; consistent with the code name of that release.=C2=A0 =C2=A0For e=
xample, the<br>
&gt; &gt; =E2=80=9Cdunfell=E2=80=9D release of Yocto will have a branch na=
med =E2=80=9Cdunfell=E2=80=9D in the<br>
&gt; &gt; official git repository, and layers compatible with dunfell will=
 have a<br>
&gt; &gt; branch named =E2=80=9Cdunfell=E2=80=9D.=C2=A0 Thus, a customer c=
an easily organise a<br>
&gt; &gt; collection of appropriate layers to make a product.<br>
&gt; &gt;<br>
&gt; &gt; In Yocto, these named branches are =E2=80=9Cstable=E2=80=9D, and=
 only take bug fixes or<br>
&gt; &gt; security-critical upgrades.=C2=A0 Active development occurs on t=
he master<br>
&gt; &gt; branch.=C2=A0 However, this methodology can be problematic if mi=
micked with<br>
&gt; &gt; the compatible layers.=C2=A0 Companies or open source projects m=
ay not wish<br>
&gt; &gt; to release a snapshot of the relevant =E2=80=9Cmaster=E2=80=9D b=
ranches under active<br>
&gt; &gt; development, due to the amount of testing, fixing, and hardening=
<br>
&gt; &gt; necessary to make a product from a non-stable release.=C2=A0 Als=
o, changes to<br>
&gt; &gt; keep the master branch of a layer working with the upstream mast=
er<br>
&gt; &gt; branch of Yocto may result in that branch no longer being compat=
ible<br>
&gt; &gt; with named branches (e.g., it might not be possible to mix and m=
atch<br>
&gt; &gt; master and dunfell).=C2=A0 So, a decision must be made on the br=
anching<br>
&gt; &gt; policy of meta-arm.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Proposal<br>
&gt; &gt;<br>
&gt; &gt; There are many different ways to resolve this issue.=C2=A0 After=
 some<br>
&gt; &gt; discussion, the best solution for us is to allow new features an=
d<br>
&gt; &gt; hardware enablement to be included in named branches (not just b=
ug<br>
&gt; &gt; fixes).=C2=A0 This will allow for a more stable software platfor=
m for<br>
&gt; &gt; software to be developed, tested, and released.=C2=A0 Also, the =
single branch<br>
&gt; &gt; allows for focused testing (limiting the amount of resources nee=
ded for<br>
&gt; &gt; CI/CD), lessens/eliminates code diverging on various branches, a=
nd<br>
&gt; &gt; lessens confusion on which branch to use. The risk of making thi=
s choice<br>
&gt; &gt; is a potentially non-stable branch which will require more frequ=
ent<br>
&gt; &gt; testing to lessen the risk, and not following the =E2=80=9Cstabl=
e=E2=80=9D methodology<br>
&gt; &gt; of the core Yocto layers (though it is not uncommon for BSP laye=
rs to<br>
&gt; &gt; behave as we are recommending).<br>
&gt; &gt;<br>
&gt; <br>
&gt; thanks for the clarifications. I believe it makes sense, and I agree =
that<br>
&gt; BSP layers tend to follow a similar process (even though it&#39;s not=
 always<br>
&gt; documented).<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Process<br>
&gt; &gt;<br>
&gt; &gt; The process for patches intended on being integrated into only t=
he<br>
&gt; &gt; master branch is the normal process of pushing to meta-arm maili=
ng list<br>
&gt; &gt; for community review, approval and integration into upstream met=
a-arm<br>
&gt; &gt; master branch.=C2=A0 For patches intended on being included in a=
 named branch<br>
&gt; &gt; are also the normal internal process of pushing to mailing list =
for<br>
&gt; &gt; community review, approval and integration into meta-arm named b=
ranch.<br>
&gt; &gt; However, any patches intended on being included on a named branc=
h must<br>
&gt; &gt; also be sent for inclusion in the master branch in a timely fash=
ion (no<br>
&gt; &gt; more than 1 week after inclusion into the named branch).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Branching strategy<br>
&gt; &gt;<br>
&gt; &gt; Named branches for meta-arm will be released as close as possibl=
e to the<br>
&gt; &gt; release of the YP LTS release.=C2=A0 Meta-arm named branches wil=
l be created<br>
&gt; &gt; from the meta-arm master branch.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Why only LTS releases? Are you not planning to have named branches fo=
r<br>
&gt; stable (e.g. non LTS) releases as well?<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; To minimize the additional work of maintaining multiple branches=
 it is<br>
&gt; &gt; assumed that there will only be two active branches at any given=
 time:<br>
&gt; &gt; master and the most recent Long Term Stable (LTS) as the named b=
ranch.<br>
&gt; &gt; All previous named will be EOLed when a new LTS has been release=
d.=C2=A0 =C2=A0Any<br>
&gt; &gt; branches that are EOLed will still exist in the meta-arm, but pa=
tches<br>
&gt; &gt; will not be accepted.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I believe users will need a branch for non LTS stable releases as wel=
l. It<br>
&gt; might not be an &#39;active&#39; product/development branch for you o=
f course, but<br>
&gt; it should exist and be opened to accept community patches at least. W=
ith<br>
&gt; the new LTS process we now expect 3 types of OE/YP users:<br>
&gt; 1. active developers on master<br>
&gt; 2. stable users on current stable, who can switch every 6 month<br>
&gt; 3. LTS users<br>
<br>
<br>
This is more of setting internal expectations on what they can submit<br>
things to.=C2=A0 My major concern is the overhead of maintaining multiple<=
br>
branches, specifically testing.=C2=A0 I would be happy to cut a release ev=
ery<br>
cycle, and, based on master CI, it should be stable.=C2=A0 Then just take<=
br>
bug fixes for these branches.=C2=A0 Would this be sufficient?<br></blockqu=
ote><div><br></div><div>I think so. The key thing here is to have a branch =
publicly available and accepting community patches that might come.=C2=A0</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Jon<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Branch transitions<br>
&gt; &gt;<br>
&gt; &gt; When an upcoming YP LTS is approaching release, meta-arm will at=
tempt to<br>
&gt; &gt; stabilize master so that the releases can coincide.<br>
&gt; &gt;<br>
&gt; &gt; T-6 weeks - Email is sent to meta-arm mailing list notifying of =
upcoming<br>
&gt; &gt; code freeze of features to meta-arm<br>
&gt; &gt;<br>
&gt; &gt; T-4 weeks - Code freeze to meta-arm.=C2=A0 Only bug fixes are ta=
ken at this<br>
&gt; &gt; point.<br>
&gt; &gt;<br>
&gt; &gt; T-0 - All bugs are fixed and layer is stable, new named branch i=
s<br>
&gt; &gt; created based on master and no new patches accepted to any previ=
ous<br>
&gt; &gt; named branches.=C2=A0 Master branch will start accepting patches=
 again.<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000002da30d05a7a6dc23--
