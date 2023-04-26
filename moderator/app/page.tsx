export default function Home() {
    return (
        <main className="flex min-h-screen flex-col">
            {/* navbar */}
            <nav className="flex flex-row items-center justify-between w-full"></nav>
            <div className="flex flex-col flex-1 justify-between items-center px-24 py-16">
                {/*  hero section with large text in the middle of the page  */}
                <section className="flex flex-col items-center justify-center w-full h-1/2">
                    <h1 className="text-6xl font-bold text-center">Moderator</h1>
                    <p className="text-2xl text-center">A simple, open-source moderation bot for Discord.</p>
                </section>
                {/*  features section with 3 cards  */}
                <section className="flex flex-1 flex-col items-center justify-center w-full h-1/2">
                    <h2 className="text-4xl font-bold text-center">Features</h2>
                    <div className="flex flex-row items-center justify-center w-full h-1/2">
                        <div className="flex flex-col items-center justify-center w-1/3 h-full">
                            <h3 className="text-2xl font-bold text-center">Moderation</h3>
                            <p className="text-center">Moderator has a wide range of moderation commands to help you
                                keep your server safe.</p>
                        </div>
                        <div className="flex flex-col items-center justify-center w-1/3 h-full">
                            <h3 className="text-2xl font-bold text-center">Customization</h3>
                            <p className="text-center">Moderator is highly customizable, allowing you to change the
                                prefix, language, and more.</p>
                        </div>
                        <div className="flex flex-col items-center justify-center w-1/3 h-full">
                            <h3 className="text-2xl font-bold text-center">Open Source</h3>
                            <p className="text-center">Moderator is open source, allowing you to view the source code
                                and contribute to the project.</p>
                        </div>
                    </div>
                </section>
            </div>
            {/*  footer section with links to the GitHub repo and the Discord server  */}
            <footer className="flex flex-col items-center justify-center w-full h-1/6 pb-8">
                <p className="text-center">Moderator is an open-source project created by <a
                    href="https://github.com/quabynah-bilson" className="text-blue-500">quabynah-bilson</a>.</p>
                <div className="flex flex-row items-center justify-center space-x-4 w-full h-1/2">
                    <a href="https://github.com/quabynah-bilson/proche" className="text-blue-500">GitHub</a>
                    <a href="https://github.com/quabynah-bilson/proche" className="text-blue-500">LinkedIn</a>
                </div>
            </footer>
        </main>
    )
}
